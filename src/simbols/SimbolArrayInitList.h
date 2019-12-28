#ifndef _H_SIMBOL_ARRAYINIT_LIST
#define _H_SIMBOL_ARRAYINIT_LIST

#include "Simbol.h"
#include "SimbolExpressio.h"
#include "SimbolArrayElementList.h"
#include <vector>

class SimbolArrayInitList : public SimbolArrayElementList {
private:
public:
    SimbolArrayInitList();
    ~SimbolArrayInitList();

    void make(Driver *driver, SimbolArrayElementList elementList);
    void make(Driver *driver, SimbolArrayInitList list, SimbolArrayElementList elementList);
};

#endif