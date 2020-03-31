#include "CallInstruction.h"

CallInstruction::CallInstruction(SubProgram *program) : Instruction(Instruction::Type::CALL){
    this->program = program;
}

CallInstruction::~CallInstruction() {}

std::string CallInstruction::toString() {
    return "call " + this->program->getNom();
}

