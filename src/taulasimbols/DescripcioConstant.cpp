#include "DescripcioConstant.h"

DescripcioConstant::DescripcioConstant(std::string tipus) : Descripcio(Descripcio::Tipus::CONSTANT) {
    this->nomTipus = tipus;
    this->tipus = Descripcio::Tipus::CONSTANT;
}

DescripcioConstant::~DescripcioConstant(){}

void DescripcioConstant::setNomTipus(std::string tipus){
    this->nomTipus = tipus;
}

std::string DescripcioConstant::getNomTipus(){
    return this->nomTipus;
}

int DescripcioConstant::getIntValue(){
    return this->intValue;
}

bool DescripcioConstant::getBoolValue(){
    return this->boolValue;
}