#ifndef _H_CODE_BASIC_BLOCK
#define _H_CODE_BASIC_BLOCK

#include "instructions/Instruction.h"
#include <list>

class CodeGeneration;

class BasicBlock{
private:
	// indiquen quines són les instruccions d'inici i final del bloc
	Instruction *start;
	Instruction *end;

	std::list<BasicBlock *> successors;
	std::list<BasicBlock *> predecessors;

	// dins la llista de blocs
	BasicBlock *prev;
	BasicBlock *next;

public:
	int mId;

	BasicBlock(Instruction *start);
	~BasicBlock();

	Instruction *getStart();

	void setEnd(Instruction *inst);
	Instruction *getEnd();

	void remove(CodeGeneration *code);

	void addEdge(BasicBlock *block, bool immediat);

	// gestió de la llista de blocs
	void setNext(BasicBlock *block);
	BasicBlock *getNext();

	void setPrevious(BasicBlock *block);
	BasicBlock *getPrevious();

	std::list<BasicBlock *> getSuccessors();

	bool optimize(CodeGeneration *code);
};

#endif