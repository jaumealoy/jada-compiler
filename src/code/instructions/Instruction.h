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
	Instruction *next;

public:
	Instruction();
	Instruction(Instruction::Type opcode);
	~Instruction();

	void setNext(Instruction *next);
	Instruction *getNext();

	std::string toString();

	Instruction::Type getType();
};

#endif