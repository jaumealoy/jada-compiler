#ifndef _H_CODE_OPTIMIZATION_AVAILABLE
#define _H_CODE_OPTIMIZATION_AVAILABLE

#include "../SubProgram.h"
#include "../BasicBlock.h"
#include "../Variable.h"
#include "../../utils/Domain.hpp"
#include "../../utils/Set.hpp"
#include "../instructions/Instruction.h"
#include "../instructions/ArithmeticInstruction.h"
#include <map>

class CodeGeneration;

class AvailableExpressions
{
private:
	// subprograma al qual es vol aplicar l'optimització
	SubProgram *subprograma;

	struct Expression {
		Variable *a;
		Variable *b;
		ArithmeticInstruction::Type operador;
		Instruction *first;
		Variable *exp;
		std::string hash;
	};

	std::map<std::string, struct Expression *> hashExpressions;

	// conjunt de totes les expressions del subprograma
	std::shared_ptr<Domain<struct Expression>> domini;
	Set<struct Expression> expressions;

	struct GK {
		Set<struct Expression> gains;
		Set<struct Expression> kills;
	};

	std::map<BasicBlock *, struct AvailableExpressions::GK> inOut;

	void calculateGK(struct AvailableExpressions::GK &gk, Instruction *inst);
	struct AvailableExpressions::GK calculateGK(BasicBlock *block);

	void calculateInOut();

public:
	AvailableExpressions(SubProgram *subprogama);
	~AvailableExpressions();

	bool optimize(CodeGeneration *code);
};

#endif