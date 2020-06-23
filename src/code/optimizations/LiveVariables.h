#ifndef _H_CODE_OPTIMIZATION_LIVE
#define _H_CODE_OPTIMIZATION_LIVE

#include "../SubProgram.h"
#include "../Variable.h"
#include "../../utils/Set.hpp"

class CodeGeneration;

class LiveVariables
{
private:
	SubProgram *programa;

	// els conjunts són de variables
	struct GK{
		Set<Variable> gains;
		Set<Variable> kills;
	};

	// càlcul de guanys
	void calculateGK(struct LiveVariables::GK &gk, Instruction *actual);
	struct LiveVariables::GK calculateGK(BasicBlock *bloc);

	std::shared_ptr<Domain<Variable>> domini;

	// conjunt in out per cada bloc bàsic
	std::map<BasicBlock *, struct LiveVariables::GK> inOut;
	void calculateInOut();

public:
	LiveVariables(CodeGeneration *code, SubProgram *programa);
	~LiveVariables();

	bool optimize(CodeGeneration *code);
};

#endif