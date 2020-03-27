#include "CallInstruction.h"

CallInstruction::CallInstruction(int np) : Instruction(Instruction::Type::CALL){
    this->np = np;
}

std::string CallInstruction::toString() {
    return ("call " + this->np );
}

void CallInstruction::setNP(int np) {
    this->np = np;
}

CallInstruction::~CallInstruction() {}