#include "CallInstruction.h"
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

std::string CallInstruction::toString() {
    return "call " + this->program->getNom();
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