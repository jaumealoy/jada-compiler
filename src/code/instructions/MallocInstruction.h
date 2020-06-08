#ifndef _H_CODE_MALLOC_INSTRUCTION
#define _H_CODE_MALLOC_INSTRUCTION

#include "Instruction.h"
#include "../Variable.h"

class CodeGeneration;

class MallocInstruction : public Instruction 
{
private:
    Variable *desti;
    Variable *nbytes;

public:
    MallocInstruction(Variable *desti, Variable *nbytes);
    ~MallocInstruction();

    std::string toString();
    void generateAssembly(CodeGeneration *code);

    Variable *getDesti();
    Variable *getBytes();
};

#endif