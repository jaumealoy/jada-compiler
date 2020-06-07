#ifndef _H_CODE_INSTRUCTION
#define _H_CODE_INSTRUCTION

#include "../Label.h"
#include "../SubProgram.h"
#include "../Variable.h"
#include "../BasicBlock.h"
#include <string>

class CodeGeneration;

class Instruction{
public:
	enum Type{
		SKIP,
		GOTO,
		CONDJUMP,
		ARITHMETIC,
		ASSIGNMENT,
		CALL,
		PUTPARAM,
		PREAMBLE,
		RETURN,
		ASSEMBLY,
		MEMORY,
		PRECALL,
		NUL
	};
private:
	Instruction::Type opcode;

	// llista doblement encadenada
	Instruction *next;
	Instruction *prev;

	// indica si aquesta instrucció s'ha afegit durant
	// l'optimització
	bool addedOptimization;

	// indica de quin bloc bàsic és la instrucció
	BasicBlock *block;

protected:
	// Tota instrucció està dins un determinat subprograma,
	// per controlar els accessos a variables
	SubProgram *invokingProgram;

public:
	Instruction();
	Instruction(Instruction::Type opcode);
	~Instruction();

	// control de la llista d'instruccions
	void setNext(Instruction *next);
	Instruction *getNext();

	void setPrevious(Instruction *previous);
	Instruction *getPrevious();

	Instruction::Type getType();

	// per gestionar el context de les variables
	void setInvokingSubProgram(SubProgram *);
	SubProgram *getInvokingSubProgram();

	// per representar
	std::string toString();
	std::string getAssemblyVariable(Variable *var);
	void generateAssembly(CodeGeneration *code);

	bool isAddedAtOptimization();
	void markAtOptimization();

	void setBasicBlock(BasicBlock *);
	BasicBlock *getBasicBlock();

	static Instruction *copy(Instruction *);
};

#endif