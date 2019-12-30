#ifndef _H_SIMBOL_FORPOST_EXPRESSION
#define _H_SIMBOL_FORPOST_EXPRESSION

#include "Simbol.h"
#include "SimbolAssignacio.h"

class SimbolForPostExpression : public Simbol {
private:
public:
    SimbolForPostExpression();
    ~SimbolForPostExpression();

    void make(Driver *driver);
    void make(Driver *driver, SimbolAssignacio assig);
};

#endif

