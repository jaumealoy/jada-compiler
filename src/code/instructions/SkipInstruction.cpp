#include "SkipInstruction.h"

SkipInstruction::SkipInstruction(int label) : Instruction(Instruction::Type::SKIP){
	this->label = label;
}

SkipInstruction::~SkipInstruction(){}

std::string SkipInstruction::toString(){
	return "e" + std::to_string(this->label) + ": skip";
}