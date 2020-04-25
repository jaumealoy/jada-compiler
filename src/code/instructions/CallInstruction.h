#ifndef _H_CALL_INSTRUCTION
#define _H_CALL_INSTRUCTION

#include "Instruction.h"
#include "../SubProgram.h"

class CallInstruction : public Instruction {
private:
	SubProgram *program;

	// on s'ha de guardar la variable de retorn, si és una funció
	Variable *var;
	
public:
    CallInstruction(SubProgram *);
    CallInstruction(SubProgram *programa, Variable *retorn);
    ~CallInstruction();

	SubProgram *getSubProgram();

    std::string toString();
	void generateAssembly(CodeGeneration *code);
};

 #endif