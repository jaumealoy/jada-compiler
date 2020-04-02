#ifndef _H_CODE_SUBPROGRAM_INIT_INSTRUCTION
#define _H_CODE_SUBPROGRAM_INIT_INSTRUCTION

#include "Instruction.h"

class SubProgramInitInstruction : public Instruction {
private:
	SubProgram *program;

public:
	SubProgramInitInstruction(SubProgram *programa);
	~SubProgramInitInstruction();

	std::string toString();
	std::string generateAssembly();
};

#endif