#ifndef _H_DESCRIPCIO_PROC
#define _H_DESCRIPCIO_PROC

#include "Descripcio.h"
#include "../code/SubProgram.h"
#include <string>

class DescripcioProc : public Descripcio {
private:
    // número de procedure
    SubProgram* subprograma;

public:
    DescripcioProc(SubProgram *subprogram);
    ~DescripcioProc();

	SubProgram *getSubPrograma();
};

#endif