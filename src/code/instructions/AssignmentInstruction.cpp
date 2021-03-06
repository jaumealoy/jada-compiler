#include "AssignmentInstruction.h"
#include "ArithmeticInstruction.h"
#include "CallInstruction.h"
#include "../CodeGeneration.h"
#include <exception>
#include <iostream>

AssignmentInstruction::AssignmentInstruction()
	: Instruction(Instruction::Type::ASSIGNMENT)
{
}

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

			case TipusSubjacentBasic::POINTER: {
				long intValue = *(long *) this->value->get();
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
		{
			// carregar b i c dins registres, sumar-los i accedir al seu contingut
			code->load(this, this->origen, CodeGeneration::Register::A);
			code->output << "movq\t$0, %rbx" << std::endl;

			int constantOffset = 0;
			if(this->offset->isConstant()){
				constantOffset = *(int *) this->offset->getValor()->get();
			}else{
				code->load(this, this->offset, CodeGeneration::Register::B);
			}

			code->output << "mov" << CodeGeneration::getSizeTag(true, this->desti->getOcupacio()) << "\t";
			if(this->offset->isConstant()){
				code->output << constantOffset << "(%rax)";
			}else{
				code->output << "(%rax, %rbx)";
			}

			code->output << ", %" << CodeGeneration::getRegister(CodeGeneration::Register::A, this->desti->getOcupacio()) << std::endl;

			code->store(this, CodeGeneration::Register::A, this->desti);
			break;
		}

		case AssignmentInstruction::Type::TARGET_OFF:  // a[c] = b
		{
			// carregar el valor a guardar (b) dins un registre
			if(this->origen->isConstant()){
				code->load(this->origen->getValor(), CodeGeneration::Register::C, this->origen->getTSB());
			}else{
				code->load(this, this->origen, CodeGeneration::Register::C);
			}

			// carregar a i c dins registres
			code->load(this, this->desti, CodeGeneration::Register::A);
			code->output << "movq\t$0, %rbx" << std::endl;
			
			int constantOffset = 0;
			if(this->offset->isConstant()){
				constantOffset = *(int *) this->offset->getValor()->get();
			}else{
				code->load(this, this->offset, CodeGeneration::Register::B);
			}

			// mov %rcx, (%rax, %rbp)
			code->output << "mov" << CodeGeneration::getSizeTag(true, this->origen->getOcupacio()) << "\t%";
			code->output << CodeGeneration::getRegister(CodeGeneration::Register::C, this->origen->getOcupacio()) << ", ";

			if(this->offset->isConstant()){
				code->output << constantOffset << "(%rax)";
			}else{
				code->output << "(%rax, %rbx)";
			}

			break;
		}

		default:
			tmp = "";
	}

};

void AssignmentInstruction::updateConstants(){
	if(this->type == AssignmentInstruction::Type::SIMPLE && (this->origen == nullptr || (this->origen->isConstant(true)))){
		// és una assignació de l'estil variable = <constant>

		if(this->origen != nullptr && this->origen->isConstant(true)){
			this->desti->setConstant(this->origen->getValor());
		}else{
			this->desti->setConstant(this->value);
		}
	}else{
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
		code->remove(this);
		return true;
	}

	if(this->type == AssignmentInstruction::Type::SIMPLE && this->origen != nullptr && this->origen == this->desti){
		// és de la forma a = a
		code->remove(this);
		return true;
	}

	if(this->type == AssignmentInstruction::Type::SIMPLE && this->origen != nullptr && this->origen->isConstant()){
		this->value = this->origen->getValor();
		this->tsb = this->origen->getTSB();
		this->origen = nullptr;
		canvis = true;
	}

	if(this->type == AssignmentInstruction::Type::SIMPLE){
		if(this->desti->getUseList().size() == 1 && this->desti->getAssignmentList().size() == 1){
			Instruction *inst = this->desti->getUseList().front();

			if(inst->getType() == Instruction::Type::ASSIGNMENT){
				AssignmentInstruction *aInst = (AssignmentInstruction *) inst;
				if(aInst->getType() == AssignmentInstruction::Type::SIMPLE){
					this->desti = aInst->getDesti();
					code->remove(aInst);

					this->desti->unlockConstant();
					this->desti->resetConstant();
					this->desti->setConstant(false);
			
					return true;
				}
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

Variable * AssignmentInstruction::getOffset(){
	return this->offset;
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