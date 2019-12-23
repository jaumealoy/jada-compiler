#ifndef _H_DESCRIPCIOARG
#define _H_DESCRIPCIOARG

#include "Descripcio.h"
#include <string>


class DescripcioArgument : public Descripcio {
public:
    enum Tipus {
        IN,
        IN_OUT
    };

private:
    std::string nomTipus;
    DescripcioArgument::Tipus tipus;

public:
    DescripcioArgument(std::string tipus, DescripcioArgument::Tipus tipusArg) : Descripcio(Descripcio::Tipus::ARGUMENT) {
        this->nomTipus = tipus;
        this->tipus = tipusArg;
    }

    ~DescripcioArgument(){}

    void setTipusArgument(DescripcioArgument::Tipus argType){
        this->tipus = tipus;
    }

    DescripcioArgument::Tipus getTipusArgument(){
        return this->tipus;
    }
};

#endif