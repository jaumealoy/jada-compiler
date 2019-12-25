#ifndef _H_DECLARACIOTIPUS 
#define _H_DECLARACIOTIPUS

#include "Descripcio.h"
#include "TipusSubjacentBasic.h"
#include <string>

class DescripcioTipus : public Descripcio {
public:
    enum Tipus {
        BASIC,
        ARRAY
    };

private:
    TipusSubjacentBasic tsb;
    DescripcioTipus::Tipus tipus;
    int ocupacio;

public:
    DescripcioTipus(TipusSubjacentBasic tsb, DescripcioTipus::Tipus tipus, int ocupacio);
    ~DescripcioTipus();

    DescripcioTipus::Tipus getTipus();

    TipusSubjacentBasic getTSB();

    int getOcupacio();
    void setOcupacio(int ocupacio);
};

class DescripcioTipusBasic : public DescripcioTipus {
private:
    long limitInferior;
    long limitSuperior;

public:
    DescripcioTipusBasic(TipusSubjacentBasic tsb, long min, long max, int ocupacio);
    ~DescripcioTipusBasic();
};

class DescripcioTipusArray : public DescripcioTipus {
private:
    std::string tipusElement;
public:
    DescripcioTipusArray(std::string tipus) : DescripcioTipus(TipusSubjacentBasic::ARRAY, DescripcioTipus::Tipus::ARRAY, 0) { }

    std::string getTipusElement() { return this->tipusElement; }
};

#endif