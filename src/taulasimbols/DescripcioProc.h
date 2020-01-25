#ifndef _H_DESCRIPCIO_PROC
#define _H_DESCRIPCIO_PROC

#include "Descripcio.h"
#include <string>

class DescripcioProc : public Descripcio {
private:
    // número de procedure
    int np;

public:
    static int numProcedure;

    DescripcioProc();
    ~DescripcioProc();
};

#endif