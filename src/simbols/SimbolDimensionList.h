#ifndef _H_SIMBOL_DIMENSION_LIST
#define _H_SIMBOL_DIMENSION_LIST

#include "Simbol.h"
#include <list>

class SimbolExpressio;

class SimbolDimensionList : public Simbol 
{
private:
    std::list<SimbolExpressio> expressions;

public:
    SimbolDimensionList();
    ~SimbolDimensionList();

    void make(Driver *driver, SimbolDimensionList list, SimbolExpressio exp);
    void make(Driver *driver, SimbolExpressio exp);

    std::list<SimbolExpressio> &getDimensionList();
};

#endif