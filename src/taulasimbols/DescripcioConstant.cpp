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

std::shared_ptr<ValueContainer> DescripcioConstant::getValue(){
	return this->value;
}

void DescripcioConstant::setValue(std::shared_ptr<ValueContainer> valor){
	this->value = valor;
}