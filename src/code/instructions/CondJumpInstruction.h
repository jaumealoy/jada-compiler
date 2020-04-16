#ifndef _H_CONDJUMP_INSTRUCTION
#define _H_CONDJUMP_INSTRUCTION

#include "Instruction.h"
#include "../Label.h"
#include "../Variable.h"


class CondJumpInstruction : public Instruction {
public:
	enum Operator{
		EQ,
		NEQ,
		LTE,
		LT,
		GTE,
		GT
	};
private:
	Operator op;
	Variable *e1;
	Variable *e2;
	Label *l;
public:
	CondJumpInstruction(Operator op, Variable *e1, Variable *e2, Label *l);
	~CondJumpInstruction();
	void setLabel(Label *l);

	std::string toString();
	void generateAssembly(CodeGeneration *code);

	// optimització
	bool optimize(CodeGeneration *code);
};

#endif