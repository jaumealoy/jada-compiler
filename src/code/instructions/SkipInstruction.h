#ifndef _H_CODE_SKIP_INSTRUCTION
#define _H_CODE_SKIP_INSTRUCTION

#include "Instruction.h"
#include "../Label.h"

class SkipInstruction : public Instruction {
private:
	int label;
	
public:
	SkipInstruction(int lbl);
	~SkipInstruction();

	std::string toString();
};

#endif