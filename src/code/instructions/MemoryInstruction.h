#ifndef _H_CODE_MEMORY_INSTRUCTION
#define _H_CODE_MEMORY_INSTRUCTION

#include "Instruction.h"
#include "../Variable.h"

class CodeGeneration;

class MemoryInstruction : public Instruction
{
public:
    enum Type {
        INCREMENT,
        DECREMENT
    };

private:
    Variable *var;
    MemoryInstruction::Type tipus;

public:
    MemoryInstruction(Variable *var, MemoryInstruction::Type type);
    ~MemoryInstruction();

    std::string toString();
    void generateAssembly(CodeGeneration *);

    void updateConstants();

    MemoryInstruction::Type getType();
    Variable *getVariable();
};

#endif