#ifndef _H_SUBPROGRAM
#define _H_SUBPROGRAM

#include "Label.h"
#include "../taulasimbols/TipusSubjacentBasic.h"
#include "../utils/Set.hpp"
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
	BasicBlock *exitBlock;

	void updateDominadors();
	void deleteBasicBlock(CodeGeneration *code, BasicBlock *block);

	// indica si es tracta d'un subprograma del llenguatge
	bool codiExtern;

public:
    SubProgram(int np, Label *start, std::string id, bool esExtern);
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
	bool isExtern();

	// gestió dels blocs bàsics
	void updateBasicBlocks(CodeGeneration *code);
	bool optimize(CodeGeneration *code);
	void draw();
	
	void setEntryBlock(BasicBlock *block);
	BasicBlock *getEntryBlock();

	void setExitBlock(BasicBlock *block);
	BasicBlock *getExitBlock();

};

#endif