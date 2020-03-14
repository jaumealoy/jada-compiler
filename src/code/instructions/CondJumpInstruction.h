#ifndef _H_CONDJUMP_INSTRUCTION
#define _H_CONDJUMP_INSTRUCTION

#include "Instruction.h"
#include "../Label.h"
#include "../Variable.h"

class CondJumpInstruction : public Instruction {
private:
	Variable e1;
	Variable e2;
	Label l;
public:
	CondJumpInstruction(Variable e1, Variable e2, Label l);
	~CondJumpInstruction();
	std::string toString();
	void setLabel(Label l);
};

#endif