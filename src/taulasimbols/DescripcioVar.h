#ifndef _H_DESCRIPCIOVAR
#define _H_DESCRIPCIOVAR

#include "Descripcio.h"
#include <string>


class DescripcioVariable : public Descripcio {
public:

private:
    std::string nomTipus;
    Descripcio::Tipus tipus;

public:
    DescripcioVariable(std::string tipus) : Descripcio(Descripcio::Tipus::VARIABLE) {
        this->nomTipus = tipus;
        this->tipus = Descripcio::Tipus::VARIABLE;
    }

    ~DescripcioVariable(){}

    void setNomTipus(std::string tipus){
        this->nomTipus = tipus;
    }

    std::string getNomTipus(){
        return this->nomTipus;
    }
};

#endif