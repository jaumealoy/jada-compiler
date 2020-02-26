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

void DescripcioConstant::setIntValue(int value){
    this->intValue = value;
}

bool DescripcioConstant::getBoolValue(){
    return this->boolValue;
}

void DescripcioConstant::setBoolValue(bool value){
    this->boolValue = value;
}

char DescripcioConstant::getCharValue(){
    return this->charValue;
}

void DescripcioConstant::setCharValue(char value){
    this->charValue = value;
}

std::shared_ptr<ValueContainer> DescripcioConstant::getValue(){
	return this->value;
}

void DescripcioConstant::setValue(std::shared_ptr<ValueContainer> valor){
	this->value = valor;
}