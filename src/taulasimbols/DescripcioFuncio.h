#ifndef _H_DESCRIPCIO_FUNCIO
#define _H_DESCRIPCIO_FUNCIO

#include "Descripcio.h"
#include <string>

class DescripcioFuncio : public Descripcio {
private:
    // número de funció
    int nf;

    // tipus del valor de retorn
    std::string tipusRetorn;

public:
    static int numFuncio;
    
    DescripcioFuncio();
    ~DescripcioFuncio();

    void setTipusRetorn(std::string tipus);
    std::string getTipusRetorn();
};

#endif
