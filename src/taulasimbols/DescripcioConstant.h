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
    char charValue;
    bool boolValue;

public:
    DescripcioConstant(std::string tipus);
    ~DescripcioConstant();

    void setNomTipus(std::string tipus);
    std::string getNomTipus();

    int getIntValue();
    void setIntValue(int value);

    char getCharValue();
    void setCharValue(char value);

    bool getBoolValue();
    void setBoolValue(bool value);
};

#endif