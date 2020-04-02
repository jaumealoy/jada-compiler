#include "CallInstruction.h"
#include "../CodeGeneration.h"

CallInstruction::CallInstruction(SubProgram *program) : Instruction(Instruction::Type::CALL){
    this->program = program;
}

CallInstruction::~CallInstruction() {}

std::string CallInstruction::toString() {
    return "call " + this->program->getNom();
}

/**
 * Invocar el subprograma (call) i eliminar 
 * els paràmetres d'entrada de la pila
 */
std::string CallInstruction::generateAssembly() {
	std::string tmp;

	tmp = "call \t" + this->program->getNom() + "\n";

	// eliminar paràmetres
	tmp += "add" + CodeGeneration::getSizeTag(true, 8);
	tmp += "\t$" + std::to_string(this->program->getOcupacioParametres()) + ", %";
	tmp += CodeGeneration::getRegister(CodeGeneration::Register::SP, 8);

	return tmp;
}