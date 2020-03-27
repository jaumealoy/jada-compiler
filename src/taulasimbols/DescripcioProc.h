#ifndef _H_DESCRIPCIO_PROC
#define _H_DESCRIPCIO_PROC

#include "Descripcio.h"
#include <string>
#include "../code/SubProgram.h"

class DescripcioProc : public Descripcio {
private:
    // número de procedure
    SubProgram* sp;

public:
    static int numProcedure;

    DescripcioProc();
    ~DescripcioProc();
};

#endif