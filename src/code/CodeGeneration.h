#ifndef _H_CODE_GENERATION
#define _H_CODE_GENERATION

#define MAX_VAR 10000
#define MAX_PROC 10000
#define MAX_BLOCKS 5000
#define MAX_LABELS 5000

#include "Table.hpp"
#include "instructions/Instruction.h"
#include "SubProgram.h"
#include "Variable.h"
#include "Label.h"
#include "BasicBlock.h"
#include <list>
#include <vector>
#include <stack>
#include <fstream>

class CodeGeneration {
private:
	// taules de variables i procediments
	Table<Variable *, MAX_VAR> vars;
	Table<SubProgram *, MAX_PROC> programs;

	Table<Label *, MAX_LABELS> labels;

	// seqüència del codi
	Instruction *first;
	Instruction *last;

	// comptadors de variables, etiquetes i subprogrames
	int labelCounter;
	int variableCounter;
	int subprogramCounter;

	void remove(Instruction *inst, bool free);
	void move(Instruction *inst, Instruction *after);

	// per controlar a quin subprograma es troba actualment
	std::stack<SubProgram *> subprogrames;
	int nivellProfunditat;

	// actualització de les taules de variables i subprogrames
	void updateVariableTable();
	void updateSubProgramTable();

	// optimitzacions
	void updateConstants();

	// blocs bàsics i optimització local
	Table<BasicBlock *, MAX_BLOCKS> basicBlocks;
	void updateBasicBlocks();

	void leaveSubProgram(bool updateLast);

	// llistat de variables globals i de subprogrames
	std::list<Variable *> globalVariables;
	std::map<SubProgram *, std::list<Variable *>> subprogramVariables;

public:
	CodeGeneration();
	~CodeGeneration();

	Label *addLabel();
	Label *addLabel(std::string name);
	
	// gestió de les variables
	Variable *addVariable(TipusSubjacentBasic tsb);
	Variable *addVariable(TipusSubjacentBasic tsb, bool);
	Variable *addVariable(TipusSubjacentBasic tsb, std::string name);
	Variable *addVariable(TipusSubjacentBasic tsb, std::string name, bool);
	std::list<Variable *> &getGlobalVariables();
	std::list<Variable *> &getSubProgramVariables(SubProgram *programa);
	
	// gestió dels subprogrames
	SubProgram *addSubProgram(std::string id, Label *label);
	SubProgram *addSubProgram(std::string id, Label *label, bool esExtern);
	void enterSubProgram(SubProgram *subprogram);
	void leaveSubProgram();

	// funcions de backpatch
	void backpatch(Label *e, Instruction *i);
	void backpatch(Label *e, std::vector<Instruction*> i);
	void backpatch(Label *e, std::list<Instruction*> i);

	// gestió de conjunts
	static std::vector<Instruction *> concat(std::vector<Instruction *> list1, std::vector<Instruction *> list2);
	static std::list<Instruction *> concat(std::list<Instruction *> list1, std::list<Instruction *> list2);
	static std::list<Instruction *> convert(std::vector<Instruction *> list);

	// gestió de les instruccions
	Instruction *addInstruction(Instruction *inst);
	void move(Instruction *start, Instruction *end, Instruction *after);
	void remove(Instruction *inst);

	// generació de codi
	void writeToFile(std::ofstream &file);
	void generateAssembly();
	
	// funcions auxiliar
	static std::string getSizeTag(bool, TipusSubjacentBasic);
	static std::string getSizeTag(bool, int);

	enum Register { A, B, C, D, SI, DI, BP, SP, R8, R9, R10, R11, R12, R13, R14 };
	static std::string getRegister(Register reg, int size);

	// macros
	void load(Instruction *caller, Variable *var, Register reg);
	void load(std::shared_ptr<ValueContainer> valor, Register reg, TipusSubjacentBasic tsb);
	void store(Instruction *caller, Register reg, Variable *var);

	// optimitzacions
	void optimize();
	Label *getTargetLabel(Label *inici);

	// arxiu de sortida en assemblador
	std::ofstream output;
};

#endif