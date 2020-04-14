#include "GoToInstruction.h"
#include "../CodeGeneration.h"

GoToInstruction::GoToInstruction(Label *label) : Instruction(Instruction::Type::GOTO) {
	this->label = label;
}

GoToInstruction::~GoToInstruction(){}

void GoToInstruction::setLabel(Label *l){
	this->label = l;
}

std::string GoToInstruction::toString(){
	return "goto e" + std::to_string(this->label->getId());
}

void GoToInstruction::generateAssembly(CodeGeneration *code){
	code->output << "jmp\te" << std::to_string(this->label->getId());
}