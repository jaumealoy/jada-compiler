#ifndef _H_CODE_SKIP_INSTRUCTION
#define _H_CODE_SKIP_INSTRUCTION

#include "Instruction.h"
#include "../Label.h"

class SkipInstruction : public Instruction {
private:
	Label label;
	
public:
	SkipInstruction(Label lbl);
	~SkipInstruction();

	std::string toString();
};

#endif