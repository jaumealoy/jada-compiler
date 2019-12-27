#ifndef _H_SIMBOL_ARITHMETIC_EXPRESSION
#define _H_SIMBOL_ARITHMETIC_EXPRESSION

#include "SimbolExpressio.h"
#include "SimbolReferencia.h"

class SimbolArithmeticExpression : public SimbolExpressio {
private:

public:
    SimbolArithmeticExpression();
    ~SimbolArithmeticExpression();

    void make(Driver *driver, SimbolExpressio exp);
    void make(Driver *driver, SimbolExpressio a, SimbolExpressio b, int tipus);
};

#endif