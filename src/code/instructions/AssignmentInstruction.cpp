#include "AssignmentInstruction.h"
#include "ArithmeticInstruction.h"
#include "CallInstruction.h"
#include "../CodeGeneration.h"
#include <exception>
#include <iostream>

AssignmentInstruction::AssignmentInstruction(TipusSubjacentBasic tsb, Variable *desti, std::shared_ptr<ValueContainer> value)
	: Instruction(Instruction::Type::ASSIGNMENT)
{
	// tipus i valor de la constant
	this->tsb = tsb;
	this->value = value;
	
	// assignació de l'estil: desti = constant
	this->type = AssignmentInstruction::Type::SIMPLE;

	// variables
	this->desti = desti;
	this->offset = nullptr;
	this->origen = nullptr;
}

AssignmentInstruction::AssignmentInstruction(Variable *desti, Variable *origen)
	: Instruction(Instruction::Type::ASSIGNMENT)
{
	// assignació de l'estil: desti = origen
	this->type = AssignmentInstruction::Type::SIMPLE;

	this->origen = origen;
	this->desti = desti;
	this->offset = nullptr;
}

AssignmentInstruction::AssignmentInstruction(AssignmentInstruction::Type type, Variable *a, Variable *b, Variable *c) 
	: Instruction(Instruction::Type::ASSIGNMENT)
{
	// assignació personalitzada
	if(this->type != AssignmentInstruction::SIMPLE && c == nullptr) {
		// error, no és pot utilitzar sense un offset vàlid
		throw new std::invalid_argument("AssignmentInstrucion: c és nullptr");
	}

	this->type = type;
	this->desti = a;
	this->origen = b;
	this->offset = c;
}

AssignmentInstruction::~AssignmentInstruction(){}

/**
 * Generació de codi intermedi
 */
std::string AssignmentInstruction::toString(){
	std::string tmp;

	switch (type){
		case AssignmentInstruction::Type::TARGET_OFF:
			tmp += this->desti->getNom() + "["+ this->offset->getNom() +"] = ";
			break;

		default:
			tmp = this->desti->getNom() + " = ";
	}

	if(origen == nullptr){ // és una constant
		switch(this->tsb){
			case TipusSubjacentBasic::BOOLEAN: {
				bool boolValue = *(bool *) this->value->get();
				
				if(boolValue){
					tmp += "true";
				}else{
					tmp += "false";
				}

				break;
			}

			case TipusSubjacentBasic::CHAR: {
				char charValue = *this->value->get();
				tmp += charValue;
				break;

			}

			case TipusSubjacentBasic::INT: {
				int intValue = *(int *) this->value->get();
				tmp += std::to_string(intValue);
				break;
			}

			default: 
				tmp += "valor no vàlid";
		}
	}else{
		switch (this->type) {
			case AssignmentInstruction::Type::SOURCE_OFF:
				tmp += this->origen->getNom() + "[" + this->offset->getNom() + "]";
				break;

			default:
				tmp += this->origen->getNom();
		}
		
	}

	return tmp;
}

/**
 * Genera el codi assemblador d'una assignació
 */
void AssignmentInstruction::generateAssembly(CodeGeneration *code){
	std::string tmp;

	switch (this->type) {
		case AssignmentInstruction::Type::SIMPLE:
			if (origen == nullptr) {
				// es tracta d'un valor constant variable = constant
				int mida = this->desti->getOcupacio();
				long valorConstant = 0;
				
				switch (mida) {
					case 1:
						valorConstant = (long) *this->value->get();
						break;

					case 4:
						valorConstant = (long) *(int *) this->value->get();
						break;

					case 8:
						valorConstant = *(long *) this->value->get();
						break;
				}

				code->output << "mov";
				code->output << CodeGeneration::getSizeTag(true, mida);
				code->output << "\t$" + std::to_string(valorConstant) + ",";
				code->output << " " + this->getAssemblyVariable(this->desti);
			} else {
				// és una assignació entre variables
				// mov origen, registre A
				code->load(this, this->origen, CodeGeneration::Register::A);

				// mov registre A, desti
				code->store(this, CodeGeneration::Register::A, desti);
			}

			break;

		case AssignmentInstruction::Type::SOURCE_OFF: // a = b[c]
			// carregar b i c dins registres, sumar-los i accedir al seu contingut
			code->load(this, this->origen, CodeGeneration::Register::A);
			code->output << "movq\t$0, %rbx" << std::endl;

			if(this->offset->isConstant()){
				code->load(this->offset->getValor(), CodeGeneration::Register::B, TipusSubjacentBasic::INT);				
			}else{
				code->load(this, this->offset, CodeGeneration::Register::B);
			}

			code->output << "mov" << CodeGeneration::getSizeTag(true, this->desti->getOcupacio()) << "\t";
			code->output << "(%rax, %rbx), %" << CodeGeneration::getRegister(CodeGeneration::Register::A, this->desti->getOcupacio()) << std::endl;

			code->store(this, CodeGeneration::Register::A, this->desti);
			break;

		case AssignmentInstruction::Type::TARGET_OFF:  // a[c] = b
			// carregar el valor a guardar (b) dins un registre
			if(this->origen->isConstant()){
				code->load(this->origen->getValor(), CodeGeneration::Register::C, this->origen->getTSB());
			}else{
				code->load(this, this->origen, CodeGeneration::Register::C);
			}

			// carregar a i c dins registres
			code->load(this, this->desti, CodeGeneration::Register::A);
			code->output << "movq\t$0, %rbx" << std::endl;
			
			if(this->offset->isConstant()){
				code->load(this->offset->getValor(), CodeGeneration::Register::B, TipusSubjacentBasic::INT);				
			}else{
				code->load(this, this->offset, CodeGeneration::Register::B);
			}

			// mov %rcx, (%rax, %rbp)
			code->output << "mov" << CodeGeneration::getSizeTag(true, this->origen->getOcupacio()) << "\t%";
			code->output << CodeGeneration::getRegister(CodeGeneration::Register::C, this->origen->getOcupacio()) << ", ";
			code->output << "(%rax, %rbx)";

			break;
		default:
			tmp = "";
	}

};

void AssignmentInstruction::updateConstants(){
	std::cout << "[" << this->toString() << "] inst" << std::endl;
	std::cout << "Comprovant constant de " << this->desti->getNom() << std::endl;
	if(this->type == AssignmentInstruction::Type::SIMPLE && (this->origen == nullptr || this->origen->isConstant())){
		// és una assignació de l'estil variable = <constant>
		std::cout << "Comprovant constant (1) de " << this->desti->getNom() << std::endl;

		if(this->origen != nullptr && this->origen->isConstant()){
			this->desti->setConstant(this->origen->getValor());
			std::cout << "Comprovant constant (1.1) de " << this->desti->getNom() << std::endl;
		}else{
			std::cout << "Comprovant constant (1.2) de " << this->desti->getNom() << std::endl;
			this->desti->setConstant(this->value);
		}
	}else{
		std::cout << "Comprovant constant (2) de " << this->desti->getNom() << std::endl;
		this->desti->setConstant(false);
	}

	// indicar ús de variable
	switch(this->type){
		case AssignmentInstruction::Type::SIMPLE:
			if(this->origen != nullptr){
				this->origen->addUseList(this);
			}
			break;
	}

	this->desti->addAssignment(this);

	std::cout << "FI [" << this->toString() << "] inst" << std::endl;

}

/**
 * Optimització de les instruccions d'assignació
 * - Les instruccions de l'estil variable = <constant> es poden eliminar
 * - Assignació simple
 * - assignació única
 */
bool AssignmentInstruction::optimize(CodeGeneration *code){
	bool canvis = false;

	if(this->desti->isConstant()){
		std::cout << "Borrant AssignmentInstruction (desti = " << this->desti->getId() << ")" << std::endl;
		code->remove(this);
		return true;
	}

	if(this->type == AssignmentInstruction::Type::SIMPLE && this->origen != nullptr && this->origen->isConstant()){
		this->value = this->origen->getValor();
		this->tsb = this->origen->getTSB();
		this->origen = nullptr;
		canvis = true;
	}

	// si la variable 
	/*if(this->type == AssignmentInstruction::Type::SIMPLE){
		// és de la forma a = b
		std::list<Instruction *> &list = this->desti->getUseList();
		Instruction *inst = list.front();
		if(list.size() == 1 && inst->getType() == Instruction::Type::ASSIGNMENT && inst != this){
			// si l'única instrucció que utilitza la variable "a" és una altra assignació 
			// simple c = a, es pot convertir amb c = b i elimiar a = b
			AssignmentInstruction *aInst = (AssignmentInstruction *) inst;
			if(aInst->getType() == AssignmentInstruction::Type::SIMPLE && aInst->getOrigen() == this->desti){
				std::cout << "CANVIANTTTTTT!!!!!" << std::endl;

				std::list<Instruction *> &altresInstruccions = this->desti->getAssignmentList();
				std::list<Instruction *>::iterator it = altresInstruccions.begin();
				while(it != altresInstruccions.end()){
					std::cout << "Altres instruccions ("<< this->desti->getId() << ") són " << (*it)->toString() << std::endl;
					if(*it != aInst){
						Instruction *aux = *it;
						if(aux->getType() == Instruction::Type::ASSIGNMENT){
							((AssignmentInstruction *) aux)->desti = aInst->getDesti();
						}
					}
					it++;
				}
				
				this->desti = aInst->getDesti();
				code->remove(aInst);
				this->updateConstants();
				return true;
			}		
		}
	}*/

	if(this->type == AssignmentInstruction::Type::SIMPLE && this->origen != nullptr){
		// la instrucció és la forma a = b
		// és possible que aquest b només s'utilitzi a aquesta instrucció
		std::list<Instruction *> &list = this->origen->getUseList();
		if(list.size() == 1){
			// canviar totes les assignacions de b:
			// b = x op_arit -> a = x op_arit y
			// b = x -> a = x
			std::cout << "Assignació simple i un únic ús " << this->toString() << std::endl; 
			std::list<Instruction *> &assignacions = this->origen->getAssignmentList();
			std::list<Instruction *>::iterator it = assignacions.begin();
			while(it != assignacions.end()){
				Instruction *aux = *it;
				if(!aux->isAddedAtOptimization()){
					if(aux->getType() == Instruction::Type::ASSIGNMENT){
						((AssignmentInstruction *) aux)->desti = this->desti;
					}else if(aux->getType() == Instruction::Type::ARITHMETIC){
						((ArithmeticInstruction *) aux)->setDesti(this->desti);
						this->desti->unlockConstant();
						this->desti->setConstant(false);
						this->desti->setConstant(false);
						this->desti->lockConstant();
					}else if(aux->getType() == Instruction::Type::CALL){
						((CallInstruction *) aux)->setDesti(this->desti);
					}
					it = assignacions.erase(it);
				}else{
					it++;
				}
			}

			if(assignacions.size() == 0){
				code->remove(this);
			}
		}
	}

	return canvis;
}


AssignmentInstruction::Type AssignmentInstruction::getType(){
	return this->type;
}

Variable * AssignmentInstruction::getDesti(){
	return this->desti;
}

/**
 * Canvia l'origen d'una instrucció d'assignació
 */
void AssignmentInstruction::setOrigen(Variable *origen){
	this->origen = origen;
}

Variable *AssignmentInstruction::getOrigen(){
	return this->origen;
}