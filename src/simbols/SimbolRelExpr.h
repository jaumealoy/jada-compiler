#ifndef _H_SIMBOL_RELEXPR
#define _H_SIMBOL_RELEXPR

#include "SimbolExpressio.h"
#include "SimbolMarcador.h"

class SimbolRelExpr : public SimbolExpressio {
private:
public:
    SimbolRelExpr();
    ~SimbolRelExpr();

    void make(Driver *driver, SimbolExpressio a, SimbolExpressio b, int tipus, SimbolMarcador m);

};

#endif