#include "DescripcioTipus.h"

DescripcioTipus::DescripcioTipus(TipusSubjacentBasic tsb, long min, long max) : Descripcio(Tipus::TIPUS){
    this->tsb = tsb;
    this->limitInferior = min;
    this->limitSuperior = max;
}

DescripcioTipus::~DescripcioTipus(){
    
}