#include "CallInstruction.h"
#include "AssignmentInstruction.h"
#include "../CodeGeneration.h"

CallInstruction::CallInstruction(SubProgram *program) : Instruction(Instruction::Type::CALL){
    this->program = program;
	this->var = nullptr;
}

CallInstruction::CallInstruction(SubProgram *program, Variable *var) : Instruction(Instruction::Type::CALL){
	this->program = program;
	this->var = var;
}

CallInstruction::~CallInstruction() {}

/**
 * Optimització de les assignacions diferides
 */
bool CallInstruction::optimize(CodeGeneration *code){
	if(this->var != nullptr){
		std::list<Instruction *> &useList = this->var->getUseList();
		if(useList.size() == 1){
			Instruction *aux = useList.front();
			if(aux->getType() == Instruction::ASSIGNMENT 
				&& ((AssignmentInstruction *) aux)->getType() == AssignmentInstruction::Type::SIMPLE)
			{
				/*this->var->getAssignmentList().clear();
				this->var->getUseList().clear();

				this->var = ((AssignmentInstruction *) aux)->getDesti();
				this->var->unlockConstant();
				this->var->setConstant(false);
				this->var->lockConstant();
				code->remove(aux);

				this->var->getAssignmentList().clear();
				this->updateConstants();

				return true;*/
			}
		}
	}

	return false;
}

void CallInstruction::updateConstants(){
	if(this->var != nullptr){
		this->var->addAssignment(this);
		this->var->setConstant(false);
	}
}

void CallInstruction::setDesti(Variable *var){
	this->var = var;
}

Variable *CallInstruction::getDesti(){
	return this->var;
}

std::string CallInstruction::toString() {
	if(this->var != nullptr){
		return this->var->getNom() + " = call " + this->program->getNom();
	}else{
    	return "call " + this->program->getNom();
	}
}

/**
 * Invocar el subprograma (call) i eliminar 
 * els paràmetres d'entrada de la pila
 */
void CallInstruction::generateAssembly(CodeGeneration *code) {
	std::string tmp;

	// invocar el subprograma
	code->output << "call \t" << this->program->getNom() << std::endl;

	// guardar la variable de retorn si és una funció
	if(var != nullptr){
		code->output << "mov" << CodeGeneration::getSizeTag(true, var->getOcupacio()) << "\t";
		code->output << std::to_string(program->getOffsetRetorn() - 8) << "(%rsp), %";
		code->output << CodeGeneration::getRegister(CodeGeneration::Register::A, var->getOcupacio()) << std::endl;
		code->store(this, CodeGeneration::Register::A, var);
	}

	// eliminar paràmetres
	code->output << "add" + CodeGeneration::getSizeTag(true, 8);
	code->output << "\t$" + std::to_string(this->program->getOcupacioParametres()) + ", %";
	code->output << CodeGeneration::getRegister(CodeGeneration::Register::SP, 8);
}

SubProgram *CallInstruction::getSubProgram(){
	return this->program;
}