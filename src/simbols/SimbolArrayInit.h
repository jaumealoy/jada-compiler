#ifndef _H_SIMBOL_ARRAYINIT
#define _H_SIMBOL_ARRAYINIT

#include "Simbol.h"
#include "SimbolExpressio.h"
#include "SimbolArrayElementList.h"

class SimbolArrayInit : public SimbolExpressio {
private:
    // per indicar si l'estructura interna és correcta o no
    bool match;
public:
    SimbolArrayInit();
    ~SimbolArrayInit();

    void make(Driver *driver, std::string tipusBasic, SimbolArrayElementList list);
    bool coincideixen();
};

#endif