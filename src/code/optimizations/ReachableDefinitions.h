#ifndef _H_CODE_OPTIMIZATION_DEFINITION
#define  _H_CODE_OPTIMIZATION_DEFINITION

#include "../SubProgram.h"
#include "../BasicBlock.h"
#include "../instructions/Instruction.h"
#include "../../utils/Set.hpp"
#include "../../utils/Domain.hpp"
#include <map>

class ReachableDefinitions
{
public:
	struct GK {
		Set<Instruction> gains;
		Set<Instruction> kills;
	};

private:
	SubProgram *program;

	// domini de les definicions
	std::shared_ptr<Domain<Instruction>> domini;
	std::list<Instruction *> dominiInstruccions;

	// conjunts inout per cada bloc bàsic
	// el camp gain és l'in i el kills l'out
	std::map<BasicBlock *, struct ReachableDefinitions::GK> inOut;

	void calculateInOut();

public:
	ReachableDefinitions(SubProgram *program);
	~ReachableDefinitions();

	void calculateGK(struct ReachableDefinitions::GK &gk, Instruction *inst);
	struct ReachableDefinitions::GK calculateGK(BasicBlock *block);

	Set<Instruction> useDefinitionChain(Instruction *inst, Variable *x);
	Set<Instruction> definitionUsage(Instruction *def);
};

#endif