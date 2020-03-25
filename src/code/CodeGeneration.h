#ifndef _H_CODE_GENERATION
#define _H_CODE_GENERATION

#define MAX_VAR 10000
#define MAX_PROC 10000

#include "Table.hpp"
#include "instructions/Instruction.h"
#include "Variable.h"
#include "Label.h"
#include <list>
#include <vector>
#include <fstream>

class CodeGeneration{
private:
	// taules de variables i procediments
	Table<char, MAX_VAR> vars;
	Table<char, MAX_PROC> programs;

	// seqüència del codi
	Instruction *first;
	Instruction *last;

	// comptadors de variables, etiquetes i subprogrames
	int labelCounter;
	int variableCounter;
	int subprogramCounter;

	void move(Instruction *inst, Instruction *after);

public:
	CodeGeneration();
	~CodeGeneration();

	Label addLabel();

	Variable addVariable();
	Variable addVariable(std::string name);
	
	Instruction *addInstruction(Instruction *inst);

	void writeToFile(std::ofstream &file);

	void backpatch(Label e, Instruction *i);
	void backpatch(Label e, std::vector<Instruction*> i);
	void backpatch(Label e, std::list<Instruction*> i);

	void move(Instruction *start, Instruction *end, Instruction *after);
	void remove(Instruction *inst);
};

#endif