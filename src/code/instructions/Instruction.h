#ifndef _H_CODE_INSTRUCTION
#define _H_CODE_INSTRUCTION

#include <string>

class Instruction{
public:
	enum Type{
		SKIP,
		GOTO
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
};

#endif