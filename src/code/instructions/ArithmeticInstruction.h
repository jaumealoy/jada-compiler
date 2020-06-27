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
		MOD,
		LEFT_SHIFT
	};

private:
	// operand 1
	Variable *v1;
	std::shared_ptr<ValueContainer> valor1;
	bool constant1;

	// operand 2
	Variable *v2;
	std::shared_ptr<ValueContainer> valor2;
	bool constant2;

	// destí
	Variable *desti;

	ArithmeticInstruction::Type type;

public:
	ArithmeticInstruction(ArithmeticInstruction::Type type, Variable *desti, Variable *v1, Variable *v2);
	~ArithmeticInstruction();

	std::string toString();
	void generateAssembly(CodeGeneration * code);

	// optimització
	bool optimize(CodeGeneration * code);
	std::string getExpressionId();

	// actualitza la informació sobre valors constants
	void updateConstants();

	Variable *getDesti();
	void setDesti(Variable *desti);

	Variable *getFirstOperand();
	Variable *getSecondOperand();

	ArithmeticInstruction::Type getOperator();
	void setOperator(ArithmeticInstruction::Type operador);
};

#endif