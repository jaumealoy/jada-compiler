#include "DescripcioTipus.h"

// Descripcio Tipus
DescripcioTipus::DescripcioTipus(TipusSubjacentBasic tsb, DescripcioTipus::Tipus tipus) 
        : Descripcio(Descripcio::Tipus::TIPUS){
    this->tsb = tsb;
    this->tipus = tipus;
}

DescripcioTipus::~DescripcioTipus() { }

DescripcioTipus::Tipus DescripcioTipus::getTipus() {
    return this->tipus;
}

TipusSubjacentBasic DescripcioTipus::getTSB(){
    return this->tsb;
}


// Descripcio Tipus Basic
DescripcioTipusBasic::DescripcioTipusBasic(TipusSubjacentBasic tsb, long min, long max)
        : DescripcioTipus(tsb, DescripcioTipus::Tipus::BASIC) {
    this->limitInferior = min;
    this->limitSuperior = max;
}

DescripcioTipusBasic::~DescripcioTipusBasic() {}

// Descripcio Tipus Array
