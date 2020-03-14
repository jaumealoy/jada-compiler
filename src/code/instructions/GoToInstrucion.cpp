#include "GoToInstruction.h"

GoToInstruction::GoToInstruction(Label label) : Instruction(Instruction::Type::GOTO) {
	this->label = label;
}

GoToInstruction::~GoToInstruction(){}