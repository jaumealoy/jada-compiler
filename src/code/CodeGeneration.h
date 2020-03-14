#ifndef _H_CODE_GENERATION
#define _H_CODE_GENERATION

#define MAX_VAR 10000
#define MAX_PROC 10000

#include "Table.hpp"
#include "instructions/Instruction.h"
#include <fstream>

class CodeGeneration{
private:
	// taules de variables i procediments
	Table<char, MAX_VAR> vars;
	Table<char, MAX_PROC> programs;

	// seqüència del codi
	Instruction *first;
	Instruction *last;

public:
	CodeGeneration();
	~CodeGeneration();

	int addLabel();
	int addVariable();
	
	Instruction *addInstruction(Instruction *inst);

	void writeToFile(std::ofstream &file);
};

#endif