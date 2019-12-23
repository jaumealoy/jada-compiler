#ifndef _H_DECLARACIOTIPUS 
#define _H_DECLARACIOTIPUS

#include "Descripcio.h"
#include "TipusSubjacentBasic.h"
#include <string>

using namespace TSB;

class DescripcioTipus : public Descripcio {
public:
    enum Tipus {
        BASIC,
        ARRAY
    };

private:
    TipusSubjacentBasic tsb;
    DescripcioTipus::Tipus tipus;

public:
    DescripcioTipus(TipusSubjacentBasic tsb, DescripcioTipus::Tipus tipus);
    ~DescripcioTipus();
};

class DescripcioTipusBasic : public DescripcioTipus {
private:
    long limitInferior;
    long limitSuperior;

public:
    DescripcioTipusBasic(TipusSubjacentBasic tsb, long min, long max);
    ~DescripcioTipusBasic();
};

class DescripcioTipusArray : public DescripcioTipus {
private:
    std::string tipusElement;
public:
    DescripcioTipusArray(std::string tipus) : DescripcioTipus(ARRAY, DescripcioTipus::Tipus::ARRAY) {
    
    }
};

#endif