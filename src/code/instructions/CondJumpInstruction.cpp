#include "CondJumpInstruction.h"

CondJumpInstruction::CondJumpInstruction(Operator op, Variable e1, Variable e2, Label l) : Instruction(Instruction::Type::CONDJUMP) {
	this->op = op;
	this->e1 = e1;
	this->e2 = e2;
	this->l = l;
}

CondJumpInstruction::~CondJumpInstruction(){}

std::string CondJumpInstruction::toString() {
	std::string opString;
	switch (this->op)
	{
		case EQ:
			opString = "==";
			break;
		case NEQ:
			opString = "!=";
			break;
		case LTE:
			opString = "<=";
			break;
		case LT:
			opString = "<";
			break;
		case GTE:
			opString = "<=";
			break;
		case GT:
			opString = ">";
			break;
		default:
			break;
	}

	return "if " + this->e1.getNom() + " " + opString + " " + this->e2.getNom() +" then goto " + this->l.toString();
}

void CondJumpInstruction::setLabel(Label l){
	this->l = l;
}