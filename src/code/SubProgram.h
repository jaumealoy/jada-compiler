#ifndef _H_SUBPROGRAM
#define _H_SUBPROGRAM

#include "Label.h"
#include "../taulasimbols/TipusSubjacentBasic.h"
#include <string>
#include <list>

class Variable;
class Instruction;
class CodeGeneration;
class BasicBlock;

class SubProgram {
private:
	int nivellProfunditat;
	std::string nom;

	// dades del subprograma
	Label *start;
	Instruction *lastInstruction;

	int numParametres; // total de paràmetres
	int ocupacioParametres; // "ocupació" dels paràmetres
	int ocupacioVariables; // espai ocupat per variables locals

	// gestió dels offsets de paràmetres i variables
	int currentOffsetVariables;
	int currentOffsetParametres;
	std::list<Variable *> variablesLocals;

	// tipus de retorn
	TipusSubjacentBasic returnTSB;

	// blocs bàsics d'entrada i sortida
	BasicBlock *basicBlocks;

public:
    SubProgram(int np, Label *start, std::string id);
    ~SubProgram();

	int getNivellProfunditat();
    void setNP(int np);

	void addVariable(Variable *var);
	int getOcupacioVariables();
	std::list<Variable *> getVariables();

	void addParameter(Variable *param);
	int getOcupacioParametres();

	void resetOffsets();

	std::string getNom();

	void setTipusRetorn(TipusSubjacentBasic tsb);
	int getOffsetRetorn();

	// gestió d'inici i final d'instruccions
	void removeInstruction(Instruction *instruction);
	Instruction *getFirstInstruction();
	Instruction *getLastInstruction();
	void setLastInstruction(Instruction *instruction);

	void markUsage();

	// gestió dels blocs bàsics
	void updateBasicBlocks();
	bool optimize(CodeGeneration *code);
	void draw();
	
	void setEntryBlock(BasicBlock *block);
	BasicBlock *getEntryBlock();

	void setExitBlock(BasicBlock *block);
	BasicBlock *getExitBlock();
};

#endif