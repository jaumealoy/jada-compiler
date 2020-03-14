#include "CondJumpInstruction.h"

CondJumpInstruction::CondJumpInstruction(Variable e1, Variable e2, Label l) : Instruction(Instruction::Type::CONDJUMP) {
	this->e1 = e1;
	this->e2 = e2;
	this->l = l;
}

CondJumpInstruction::~CondJumpInstruction(){}

std::string CondJumpInstruction::toString() {
	return "if " + this->e1.getNom() + " = " + this->e2.getNom() +" then goto " + std::to_string(this->l.getId());
}

void CondJumpInstruction::setLabel(Label l){
	this->l = l;
}