#ifndef _H_CONDJUMP_INSTRUCTION
#define _H_CONDJUMP_INSTRUCTION

#include "Instruction.h"
#include "../Label.h"
#include "../Variable.h"

enum Operator{
	EQ,
	NEQ,
	LTE,
	LT,
	GTE,
	GT
};

class CondJumpInstruction : public Instruction {
private:
	Operator op;
	Variable e1;
	Variable e2;
	Label l;
public:
	CondJumpInstruction(Operator op, Variable e1, Variable e2, Label l);
	~CondJumpInstruction();
	std::string toString();
	void setLabel(Label l);
};

#endif