#include "SkipInstruction.h"

SkipInstruction::SkipInstruction(Label lbl) : Instruction(Instruction::Type::SKIP){
	this->label = lbl;
}

SkipInstruction::~SkipInstruction(){}