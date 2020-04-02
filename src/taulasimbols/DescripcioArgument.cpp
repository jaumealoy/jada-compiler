#include "DescripcioArgument.h"

DescripcioArgument::DescripcioArgument(std::string tipus, DescripcioArgument::Tipus argType) 
	: Descripcio(Descripcio::Tipus::ARGUMENT)
{
	this->nomTipus = tipus;
	this->tipus = argType;
}

DescripcioArgument::~DescripcioArgument() {}


void DescripcioArgument::setTipusArgument(DescripcioArgument::Tipus argType){
	this->tipus = argType;
}

DescripcioArgument::Tipus DescripcioArgument::getTipusArgument(){
	return this->tipus;
}

std::string DescripcioArgument::getNomTipusArgument(){
    return this->nomTipus;
}

void DescripcioArgument::setVariable(Variable *var) {
	this->var = var;
}

Variable *DescripcioArgument::getVariable(){
	return this->var;
}