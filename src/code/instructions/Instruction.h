#ifndef _H_CODE_INSTRUCTION
#define _H_CODE_INSTRUCTION

#include "../Label.h"
#include "../SubProgram.h"
#include "../Variable.h"
#include <string>

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
		PROGRAMINIT,
		RETURN
	};
private:
	Instruction::Type opcode;

	// llista doblement encadenada
	Instruction *next;
	Instruction *prev;

protected:
	// Tota instrucció està dins un determinat subprograma,
	// per controlar els accessos a variables
	SubProgram *invokingProgram;
	std::string getAssemblyVariable(Variable *var);

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
	std::string generateAssembly();
};

#endif