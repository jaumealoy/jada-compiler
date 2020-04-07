#ifndef _H_DESCRIPCIO_FUNCIO
#define _H_DESCRIPCIO_FUNCIO

#include "Descripcio.h"
#include "../code/SubProgram.h"
#include <string>

class DescripcioFuncio : public Descripcio {
private:
    // definicó del subprograma
    SubProgram *subprograma;

    // tipus del valor de retorn
    std::string tipusRetorn;

public:   
    DescripcioFuncio(SubProgram *programa);
    ~DescripcioFuncio();

    void setTipusRetorn(std::string tipus);
    std::string getTipusRetorn();

	SubProgram *getSubPrograma();
};

#endif
