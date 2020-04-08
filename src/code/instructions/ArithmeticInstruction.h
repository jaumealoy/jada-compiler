#ifndef _H_CODE_ARITHMETIC_INSTRUCTION
#define _H_CODE_ARITHMETIC_INSTRUCTION

#include "Instruction.h"
#include "../Variable.h"

class ArithmeticInstruction : public Instruction {
public:
	enum Type{
		ADDITION,
		SUBTRACTION,
		MULTIPLICATION,
		DIVISION,
		MOD
	};

private:
	Variable *v1;
	Variable *v2;
	Variable *desti;

	ArithmeticInstruction::Type type;

public:
	ArithmeticInstruction(ArithmeticInstruction::Type type, Variable *desti, Variable *v1, Variable *v2);
	~ArithmeticInstruction();

	std::string toString();
	void generateAssembly(CodeGeneration * code);
};

#endif