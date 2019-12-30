#ifndef _H_SIMBOL_VARINIT
#define _H_SIMBOL_VARINIT

#include "Simbol.h"
#include "SimbolExpressio.h"
#include "SimbolArrayInit.h"

class SimbolVarInit : public SimbolExpressio {
public:
    SimbolVarInit();
    ~SimbolVarInit();

    void make(Driver *driver, SimbolExpressio exp);
    void make(Driver *driver, SimbolArrayInit exp);
    void make(Driver *driver);
};

#endif