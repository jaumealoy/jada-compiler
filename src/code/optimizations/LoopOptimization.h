#ifndef _H_CODE_OPTIMIZATION_LOOP
#define _H_CODE_OPTIMIZATION_LOOP

#include "../SubProgram.h"
#include "../instructions/Instruction.h"
#include "../instructions/SkipInstruction.h"
#include "ReachableDefinitions.h"
#include <map>
#include <vector>

class CodeGeneration;

class LoopOptimization
{
private:
	// subprograma del qual s'ha d'optimitzar 
	SubProgram *programa;

	struct Loop {
		// capçaleres
		BasicBlock *preheader;
		BasicBlock *header;

		// bloc que retorna al header
		BasicBlock *jump;
	};

	// el bucles que s'han identificat amb l'ordre que s'han d'optimitzar
	std::vector<struct Loop> loops;

	struct Assignment {
		// instrucció que fa l'assignació, vàlid si counter = 1
		Instruction *inst;

		// número d'assignacions a la variable
		int counter;
	};

	void otb(std::vector<BasicBlock *> &resultat, std::map<BasicBlock *, bool> &visitats, BasicBlock *actual);
	std::list<BasicBlock *> getBasicBlocksInLoop(struct Loop &loop);

	// extracció d'invariants
	void checkInvariant(Instruction *inst, std::map<Instruction *, int> &invariants, std::list<BasicBlock *> &blocs);
	ReachableDefinitions definitions;

	// variables d'inducció
	struct InductionVariable{
		Variable *var;
		long factor;
		long constant;
		bool basica;
		Instruction *inst;
	};

	struct InductionAux {
		int counter;
		Instruction *inst;
		Variable *var;
	};

	bool optimizeInductionVariables(CodeGeneration *code);

public:
	LoopOptimization(CodeGeneration *code, SubProgram *programa);
	~LoopOptimization();

	bool optimize(CodeGeneration *code);
};

#endif