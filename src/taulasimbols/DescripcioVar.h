#ifndef _H_DESCRIPCIOVAR
#define _H_DESCRIPCIOVAR

#include "Descripcio.h"
#include <string>


class DescripcioVariable : public Descripcio {
private:
    std::string nomTipus;
    Descripcio::Tipus tipus;

    int nv;

public:
    static int numVariables;

    DescripcioVariable(std::string tipus);
    ~DescripcioVariable();

    void setNomTipus(std::string tipus);
    std::string getNomTipus();
};

#endif