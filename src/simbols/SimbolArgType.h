#ifndef _H_SIMBOL_ARG_TYPE
#define _H_SIMBOL_ARG_TYPE

#include "Simbol.h"

class SimbolArgType : public Simbol {
private:
public:
    SimbolArgType();
    ~SimbolArgType();

    void make(Driver *driver, bool constant);
};

#endif