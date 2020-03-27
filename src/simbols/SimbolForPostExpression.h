#ifndef _H_SIMBOL_FORPOST_EXPRESSION
#define _H_SIMBOL_FORPOST_EXPRESSION

#include "Simbol.h"
#include "SimbolAssignacio.h"

class SimbolForPostExpression : public Simbol {
private:
	Instruction *begin;
	Instruction *end;

public:
    SimbolForPostExpression();
    ~SimbolForPostExpression();

    void make(Driver *driver);
    void make(Driver *driver, SimbolAssignacio assig, SimbolMarcador m1, SimbolMarcador m2);

	Instruction *getBegin();
	Instruction *getEnd();
};

#endif

