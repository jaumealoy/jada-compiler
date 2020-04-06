#ifndef _H_CALL_INSTRUCTION
#define _H_CALL INSTRUCTION

#include "Instruction.h"
#include "../SubProgram.h"

class CallInstruction : public Instruction {
private:
	SubProgram *program;
	
public:
    CallInstruction(SubProgram *);
    ~CallInstruction();

    std::string toString();
	void generateAssembly(CodeGeneration *code);
};

 #endif