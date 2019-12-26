#ifndef _H_DESCRIPCIOCONST
#define _H_DESCRIPCIOCONST

#include "Descripcio.h"
#include <string>


class DescripcioConstant : public Descripcio {
public:

private:
    std::string nomTipus;
    Descripcio::Tipus tipus;

public:
    DescripcioConstant(std::string tipus) : Descripcio(Descripcio::Tipus::CONSTANT) {
        this->nomTipus = tipus;
        this->tipus = Descripcio::Tipus::CONSTANT;
    }

    ~DescripcioConstant(){}

    void setNomTipus(std::string tipus){
        this->nomTipus = tipus;
    }

    std::string getNomTipus(){
        return this->nomTipus;
    }
};

#endif