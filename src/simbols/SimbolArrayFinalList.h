#ifndef _H_SIMBOL_ARRAYFINAL_LIST
#define _H_SIMBOL_ARRAYFINAL_LIST

#include "Simbol.h"
#include "SimbolArrayElementList.h"
#include "SimbolExpressio.h"
#include <vector>

class SimbolArrayFinalList : public SimbolArrayElementList {
private:
public:
    SimbolArrayFinalList();
    ~SimbolArrayFinalList();

    void make(Driver *driver, SimbolExpressio exp);
    void make(Driver *driver, SimbolArrayFinalList list, SimbolExpressio exp);
};

#endif