#ifndef _H_CODE_INSTRUCTION_PRECALL
#define _H_CODE_INSTRUCTION_PRECALL

#include "Instruction.h"
#include "../SubProgram.h"

class PreCallInstruction : public Instruction
{
private:
    SubProgram *programa;

public:
    PreCallInstruction(SubProgram *programa);
    ~PreCallInstruction();

    std::string toString();
	void generateAssembly(CodeGeneration *);
};

#endif