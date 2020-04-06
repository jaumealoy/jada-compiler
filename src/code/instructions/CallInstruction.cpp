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
void CallInstruction::generateAssembly(CodeGeneration *code) {
	std::string tmp;

	// invocar el subprograma
	code->output << "call \t" << this->program->getNom() << std::endl;

	// eliminar paràmetres
	code->output << "add" + CodeGeneration::getSizeTag(true, 8);
	code->output << "\t$" + std::to_string(this->program->getOcupacioParametres()) + ", %";
	code->output << CodeGeneration::getRegister(CodeGeneration::Register::SP, 8);
}