#include "DescripcioTipus.h"

// Descripcio Tipus
DescripcioTipus::DescripcioTipus(TipusSubjacentBasic tsb, DescripcioTipus::Tipus tipus, int ocupacio) 
        : Descripcio(Descripcio::Tipus::TIPUS){
    this->tsb = tsb;
    this->tipus = tipus;
    this->ocupacio = ocupacio;
}

DescripcioTipus::~DescripcioTipus() { }

DescripcioTipus::Tipus DescripcioTipus::getTipus() {
    return this->tipus;
}

TipusSubjacentBasic DescripcioTipus::getTSB(){
    return this->tsb;
}


void DescripcioTipus::setOcupacio(int ocupacio) {
    this->ocupacio = ocupacio;
}

int DescripcioTipus::getOcupacio(){
    return this->ocupacio;
}

// Descripcio Tipus Basic
DescripcioTipusBasic::DescripcioTipusBasic(TipusSubjacentBasic tsb, long min, long max, int ocupacio)
        : DescripcioTipus(tsb, DescripcioTipus::Tipus::BASIC, ocupacio) {
    this->limitInferior = min;
    this->limitSuperior = max;
}

DescripcioTipusBasic::~DescripcioTipusBasic() {}

// Descripcio Tipus Array
