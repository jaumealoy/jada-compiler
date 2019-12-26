#ifndef _H_SIMBOL_VARINIT
#define _H_SIMBOL_VARINIT

#include "Simbol.h"
#include "SimbolExpressio.h"

class SimbolVarInit : public SimbolExpressio {
private:
public:
    SimbolVarInit();
    ~SimbolVarInit();

    void make(Driver *driver, SimbolExpressio exp);
    void make(Driver *driver);
};

#endif