#ifndef _H_CODE_INSTRUCTION
#define _H_CODE_INSTRUCTION

#include <string>
#include "../Label.h"

class Instruction{
public:
	enum Type{
		SKIP,
		GOTO,
		CONDJUMP,
		ARITHMETIC,
		ASSIGNMENT
	};
private:
	Instruction::Type opcode;

	// llista doblement encadenada
	Instruction *next;
	Instruction *prev;

public:
	Instruction();
	Instruction(Instruction::Type opcode);
	~Instruction();

	void setNext(Instruction *next);
	Instruction *getNext();

	void setPrevious(Instruction *previous);
	Instruction *getPrevious();

	std::string toString();

	Instruction::Type getType();
};

#endif