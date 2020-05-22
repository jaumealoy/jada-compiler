#ifndef _H_CODE_OPTIMIZATION_LOOP
#define _H_CODE_OPTIMIZATION_LOOP

#include "../SubProgram.h"
#include "../instructions/Instruction.h"
#include "../instructions/SkipInstruction.h"
#include <map>
#include <vector>

class CodeGeneration;

class LoopOptimization
{
private:
	// subprograma del qual s'ha d'optimitzar 
	SubProgram *programa;

	struct Loop {
		SkipInstruction *preheader;

	};

	void otb(std::vector<BasicBlock *> &resultat, std::map<BasicBlock *, bool> &visitats, BasicBlock *actual);

public:
	LoopOptimization(SubProgram *programa);
	~LoopOptimization();

	bool optimize(CodeGeneration *code);
};

#endif