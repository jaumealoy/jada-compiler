#ifndef _H_SIMBOL_FOR_INIT
#define _H_SIMBOL_FOR_INIT

#include "SimbolForInit.h"
#include "SimbolVarDecl.h"
#include "SimbolAssignacio.h"

class SimbolForInit : public Simbol {
private:
public:
    SimbolForInit();
    ~SimbolForInit();

    void make(Driver *driver);
    void make(Driver *driver, SimbolVarDecl var);
    void make(Driver *driver, SimbolAssignacio assig);
};

#endif