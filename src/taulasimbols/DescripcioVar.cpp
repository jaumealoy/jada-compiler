#include "DescripcioVar.h"

int DescripcioVariable::numVariables = 0;

DescripcioVariable::DescripcioVariable(std::string tipus) : Descripcio(Descripcio::Tipus::VARIABLE) {
    this->nomTipus = tipus;
    this->tipus = Descripcio::Tipus::VARIABLE;

    // incrementar i assignar nv
    this->nv = DescripcioVariable::numVariables++;
}

DescripcioVariable::~DescripcioVariable(){}

void DescripcioVariable::setNomTipus(std::string tipus){
    this->nomTipus = tipus;
}

std::string DescripcioVariable::getNomTipus(){
    return this->nomTipus;
}