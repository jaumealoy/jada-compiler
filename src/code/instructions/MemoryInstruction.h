#ifndef _H_CODE_MEMORY_INSTRUCTION
#define _H_CODE_MEMORY_INSTRUCTION

#include "Instruction.h"
#include "../CodeGeneration.h"

class MemoryInstruction : public Instruction {
private:
	// indica si es tracta d'un store o load
	bool store;

	// dades
	CodeGeneration::Register reg;
	Variable *var;

public:
	MemoryInstruction(bool store, Variable *var, CodeGeneration::Register reg);
	~MemoryInstruction();

	void generateAssembly(CodeGeneration *code);
};

#endif