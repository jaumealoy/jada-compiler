#ifndef _H_CALL_INSTRUCTION
#define _H_CALL INSTRUCTION

#include "Instruction.h"

class CallInstruction : public Instruction {
private:
    int np;
public:
    CallInstruction(int np);
    ~CallInstruction();

    void setNP(int np);

    std::string toString();
};

 #endif