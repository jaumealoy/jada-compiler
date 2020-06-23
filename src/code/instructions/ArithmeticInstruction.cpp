#include "ArithmeticInstruction.h"
#include "AssignmentInstruction.h"
#include "../CodeGeneration.h"

bool isPower2(long n);

ArithmeticInstruction::ArithmeticInstruction(ArithmeticInstruction::Type type, Variable *desti, Variable *v1, Variable *v2) 
	: Instruction(Instruction::Type::ARITHMETIC) 
{
	this->type = type;
	this->desti = desti;
	this->v1 = v1;
	this->v2 = v2;
	this->constant1 = false;
	this->constant2 = false;
}

ArithmeticInstruction::~ArithmeticInstruction(){}

std::string ArithmeticInstruction::toString(){
	std::string tmp;
	switch(this->type){
		case ArithmeticInstruction::Type::ADDITION:
			tmp = "+";
			break;
		
		case ArithmeticInstruction::Type::SUBTRACTION:
			tmp = "-";
			break;

		case ArithmeticInstruction::Type::MULTIPLICATION:
			tmp = "*";
			break;

		case ArithmeticInstruction::Type::DIVISION:
			tmp = "/";
			break;

		case ArithmeticInstruction::Type::MOD:
			tmp = "%";
			break;

		case ArithmeticInstruction::Type::LEFT_SHIFT:
			tmp = "<<";
			break;
	}

	return this->desti->getNom() + " = " + this->v1->getNom() + " " + tmp + " " + this->v2->getNom();
}

void ArithmeticInstruction::generateAssembly(CodeGeneration *code){
	switch (this->type) {
		case ArithmeticInstruction::Type::ADDITION:
		case ArithmeticInstruction::Type::SUBTRACTION: {
			// carregar els operands
			if(this->v1->isConstant()){
				code->load(this->valor1, CodeGeneration::Register::A, this->v1->getTSB());
			}else{
				code->load(this, this->v1, CodeGeneration::Register::A);
			}

			if(this->v2->isConstant()){
				code->load(this->valor2, CodeGeneration::Register::D, this->v2->getTSB());
			}else{
				code->load(this, this->v2, CodeGeneration::Register::D);
			}

			std::string opcode = "add";
			if(this->type == ArithmeticInstruction::Type::SUBTRACTION){
				opcode = "sub";
			}

			// realitzar l'operació, el resultat és al registre A
			code->output << opcode << CodeGeneration::getSizeTag(true, this->desti->getOcupacio());
			code->output << "\t%" << CodeGeneration::getRegister(CodeGeneration::Register::D, this->desti->getOcupacio());
			code->output << ", %" << CodeGeneration::getRegister(CodeGeneration::Register::A, this->desti->getOcupacio()) << std::endl;

			code->store(this, CodeGeneration::Register::A, this->desti);
			break;
		}

		case ArithmeticInstruction::Type::MULTIPLICATION:
		{
			// clear dels registres
			code->output << "xorq\t%" << CodeGeneration::getRegister(CodeGeneration::Register::A, 8) << ", %" 
				<< CodeGeneration::getRegister(CodeGeneration::Register::A, 8) << std::endl;
			code->output << "xorq\t%" << CodeGeneration::getRegister(CodeGeneration::Register::D, 8) << ", %" 
				<< CodeGeneration::getRegister(CodeGeneration::Register::D, 8) << std::endl;
		
			// carregar els operands
			if(this->v1->isConstant()){
				code->load(this->valor1, CodeGeneration::Register::A, this->v1->getTSB());
			}else{
				// és una constant
				code->load(this, this->v1, CodeGeneration::Register::A);
			}

			if(this->v2->isConstant()){
				code->load(this->valor2, CodeGeneration::Register::D, this->v2->getTSB());
			}else{
				code->load(this, this->v2, CodeGeneration::Register::D);
			}

			// realitzar l'operació, a = a * d
			code->output << "imul\t%" << CodeGeneration::getRegister(CodeGeneration::Register::D, 8) << ", ";
			code->output << "%" << CodeGeneration::getRegister(CodeGeneration::Register::A, 8) << std::endl;

			code->store(this, CodeGeneration::Register::A, this->desti);
			break;
		}

		case ArithmeticInstruction::Type::DIVISION:
		case ArithmeticInstruction::Type::MOD:
		{
			// borrar els registres
			code->output << "movq\t$0, %" << CodeGeneration::getRegister(CodeGeneration::Register::A, 8) << std::endl;
			code->output << "movq\t$0, %" << CodeGeneration::getRegister(CodeGeneration::Register::D, 8) << std::endl;
			code->output << "movq\t$0, %" << CodeGeneration::getRegister(CodeGeneration::Register::R8, 8) << std::endl;

			// carregar els operands
			if(this->v2->isConstant()){
				code->load(this->valor2, CodeGeneration::Register::A, this->v2->getTSB());
			}else{
				code->load(this, this->v2, CodeGeneration::Register::A);
			}

			code->output << "cdqe" << std::endl;
			code->output << "movq\t%rax, %r8" << std::endl;

			if(this->v1->isConstant()){
				code->load(this->valor1, CodeGeneration::Register::A, this->v1->getTSB());
			}else{
				code->load(this, this->v1, CodeGeneration::Register::A);
			}

			code->output << "cdqe" << std::endl;

			code->output << "idiv\t%" << CodeGeneration::getRegister(CodeGeneration::Register::R8, 8) << std::endl;

			// es guardarà el contingut del registre A o D en funció de
			// si es tracta d'una operació de divisó o de mòdul
			if(this->type == ArithmeticInstruction::Type::DIVISION){
				code->store(
					this,
					CodeGeneration::Register::A,
					this->desti
				);
			}else{ // és una operació de mòdul
				code->store(
					this,
					CodeGeneration::Register::D,
					this->desti
				);
			}

			break;
		}

		case LEFT_SHIFT:
		{
			// carregar els operands
			if(this->v1->isConstant()){
				code->load(this->valor1, CodeGeneration::Register::A, this->v1->getTSB());
			}else{
				// és una constant
				code->load(this, this->v1, CodeGeneration::Register::A);
			}

			if(this->v2->isConstant()){
				// és una constant
				code->load(this->valor2, CodeGeneration::Register::D, this->v2->getTSB());
			}else{
				code->load(this, this->v2, CodeGeneration::Register::D);
			}

			code->output << "shl" << CodeGeneration::getSizeTag(true, this->v1->getOcupacio()) << "\t";

			if(this->v2->isConstant()){
				int valorConstant = *(int *) this->valor2->get();
				code->output << "$" << valorConstant << ", ";
			}else{
				code->output << "%" << CodeGeneration::getRegister(CodeGeneration::Register::D, this->v1->getOcupacio()) << ", ";
			}
			
			code->output << "%" << CodeGeneration::getRegister(CodeGeneration::Register::A, this->v1->getOcupacio()) << std::endl;

			code->store(this, CodeGeneration::Register::A, this->desti);

			break;
		}
	}

}

void ArithmeticInstruction::updateConstants(){
	// la variable destí podrà ser una constant si els dos
	// operands són constant i no és cap de les variables
	// dels operands
	
	this->desti->setConstant(false);

	this->v1->addUseList(this);
	this->v2->addUseList(this);

	this->desti->addAssignment(this);
}

/**
 * Optimitza la instrucció aritmètica.
 * Si els dos operands són constants, es pot simplificar a una instrucció
 * d'assignació de l'estil desti = <constant>
 * 
 * És necessari haver executat prèvicament updateConstants()
 */
bool ArithmeticInstruction::optimize(CodeGeneration *code){
	bool canvis = false;

	// comprovar si les variables són constants
	if(this->v1->isConstant() && !this->constant1){
		this->valor1 = this->v1->getValor();
		constant1 = true;
		canvis = true;
	}

	if(this->v2->isConstant() && !this->constant2){
		this->valor2 = this->v2->getValor();
		constant2 = true;
		canvis = true;
	}

	// si les dues variables són constants, es converteix en una instrucció
	// d'assignació perquè el valor de l'operació es pot conèixer en temps de
	// compilació
	if(this->v1->isConstant() && this->v2->isConstant()){
		// calcular el valor de l'operació
		
		long resultat, a, b;

		switch (this->valor1->getSize()){
			case 1:
				a = (long) *this->valor1->get();
				b = (long) *this->valor2->get();
				break;

			case 4:
				a = (long) (*(int *) this->valor1->get());
				b = (long) (*(int *) this->valor2->get());
				break;

			case 8:
				a = *(long *) this->valor1->get();
				b = *(long *) this->valor2->get();
				break;
		}

		switch (this->type){
			case ArithmeticInstruction::ADDITION: resultat = a + b; break;
			case ArithmeticInstruction::SUBTRACTION: resultat = a - b; break;
			case ArithmeticInstruction::MULTIPLICATION: resultat = a * b; break;
			case ArithmeticInstruction::DIVISION: resultat = a / b; break;
			case ArithmeticInstruction::MOD: resultat = a % b; break;
		}

		Instruction *assi = code->addInstruction(new AssignmentInstruction(
			this->desti->getTSB(),
			this->desti,
			std::make_shared<ValueContainer>((const char *) &resultat, TSB::sizeOf(this->desti->getTSB()))
		));
		
		assi->setInvokingSubProgram(this->getInvokingSubProgram());

		code->move(assi, assi, this);
		code->remove(this);
		return true;
	}else{
		// si una de les constants és 1 o 0 es pot simplificar el càlcul
		// a = b * 1 ==> a = b
		// a = b * 0 ==> a = 0
		if(this->type == ArithmeticInstruction::Type::MULTIPLICATION){
			/*if(this->v1->isConstant()){
				long a = *(int *) this->valor1->get();
				if(a == 0){
					Instruction *assig = code->addInstruction(new AssignmentInstruction(
						TipusSubjacentBasic::INT,
						this->desti,
						std::make_shared<ValueContainer>((char *) &a, sizeof(int))
					));

					code->move(assig, assig, this);
					code->remove(this);
					return true;
				}else if(a == 1){
					Instruction *assig = code->addInstruction(new AssignmentInstruction(
						this->desti,
						this->v2
					));

					code->move(assig, assig, this);
					code->remove(this);
					return true;
				}else if(isPower2(a)){
					// convertir a una operació de l'estil
					// desti = (2^n) * b ==> desti = b << a
					/*this->type = ArithmeticInstruction::Type::LEFT_SHIFT;
					
					Variable *aux = this->v1;
					this->v1 = this->v2;
					this->v2 = aux;
					this->valor2 = this->valor1;
					return true;*/
			/*	}
			}else if(this->v2->isConstant()){
				long b = *(int *) this->valor2->get();
				if(b == 0){
					Instruction *assig = code->addInstruction(new AssignmentInstruction(
						TipusSubjacentBasic::INT,
						this->desti,
						std::make_shared<ValueContainer>((char *) &b, sizeof(int))
					));

					code->move(assig, assig, this);
					code->remove(this);
					return true;
				}else if(b == 1){
					Instruction *assig = code->addInstruction(new AssignmentInstruction(
						this->desti,
						this->v1
					));

					code->move(assig, assig, this);
					code->remove(this);
					return true;
				}else if(isPower2(b)){
					// convertir a una operació de l'estil
					// desti = a * (2^n) ==> desti = a << b
					/*this->type = ArithmeticInstruction::Type::LEFT_SHIFT;
					return true;*/
			/*	}
			}*/
		}
	}

	// si la variable destí només s'utilitza a un únic lloc
	// a = b + c
	// x = a
	// es pot fer directament x = b + c
	std::list<Instruction *> &useList = this->desti->getUseList();
	if(useList.size() == 1 && this->desti->getAssignmentList().size() == 1){
		Instruction *inst = useList.front();
		
		if(inst->getType() == Instruction::Type::ASSIGNMENT){
			AssignmentInstruction *aInst = (AssignmentInstruction *) inst;
			this->desti = aInst->getDesti();
			code->remove(aInst);
			
			this->desti->unlockConstant();
			this->desti->resetConstant();
			this->desti->setConstant(false);
			this->desti->lockConstant();
			
			this->updateConstants();

			return true;
		}
	}

	return canvis;
}

/**
 * Retorna l'identificador de l'expressió
 */
std::string ArithmeticInstruction::getExpressionId(){
	// totes les expressions són de la forma
	// v1 op v2

	// si les variables són constants, no s'ha de retornar l'id de la variable
	std::string var1 = this->v1->getNom();
	if(!this->v1->isConstant()){
		var1 += "_v" + std::to_string(this->v1->getId());
	}

	std::string var2 = this->v2->getNom();
	if(!this->v2->isConstant()){
		var2 += "_v" + std::to_string(this->v2->getId());
	}

	return var1 + "op" + std::to_string(this->type) + var2;
}

Variable * ArithmeticInstruction::getDesti(){
	return this->desti;
}

void ArithmeticInstruction::setDesti(Variable *desti){
	this->desti = desti;
}

Variable *ArithmeticInstruction::getFirstOperand(){
	return this->v1;
}

Variable *ArithmeticInstruction::getSecondOperand(){
	return this->v2;
}

ArithmeticInstruction::Type ArithmeticInstruction::getOperator(){
	return this->type;
}

/**
 * Determina si un valor enter és una potència de 2
 */
bool isPower2(long n){
	return (n != 0) && ((n & (n - 1)) == 0);
}