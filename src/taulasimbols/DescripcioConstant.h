#ifndef _H_DESCRIPCIOCONST
#define _H_DESCRIPCIOCONST

#include "Descripcio.h"
#include <string>


class DescripcioConstant : public Descripcio {
public:

private:
    std::string nomTipus;
    Descripcio::Tipus tipus;

    int intValue;
    bool boolValue;

public:
    DescripcioConstant(std::string tipus);
    ~DescripcioConstant();

    void setNomTipus(std::string tipus);
    std::string getNomTipus();

    int getIntValue();
    bool getBoolValue();
};

#endif