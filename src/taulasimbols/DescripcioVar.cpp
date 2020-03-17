#include "DescripcioVar.h"

DescripcioVariable::DescripcioVariable(std::string tipus) : Descripcio(Descripcio::Tipus::VARIABLE) {
    this->nomTipus = tipus;
    this->tipus = Descripcio::Tipus::VARIABLE;
}

DescripcioVariable::~DescripcioVariable(){}

void DescripcioVariable::setNomTipus(std::string tipus){
    this->nomTipus = tipus;
}

std::string DescripcioVariable::getNomTipus(){
    return this->nomTipus;
}

void DescripcioVariable::setVariable(Variable var){
	this->variable = var;
}

Variable DescripcioVariable::getVariable(){
	return this->variable;
}