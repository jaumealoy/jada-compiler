#ifndef _H_SIMBOL_ASSIGNACIO
#define _H_SIMBOL_ASSIGNACIO

#include "Simbol.h"
#include "SimbolExpressio.h"
#include "SimbolReferencia.h"
#include "SimbolArrayInit.h"

class SimbolAssignacio : public Simbol {
private:
public:
    SimbolAssignacio();
    ~SimbolAssignacio();

    void make(Driver *driver, SimbolReferencia ref, SimbolExpressio exp, int tipus);
    void make(Driver *driver, SimbolReferencia ref, SimbolArrayInit arrayInit);
    void make(Driver *driver, SimbolReferencia ref, int tipus);
};

#endif