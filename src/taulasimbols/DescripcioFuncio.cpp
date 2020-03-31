#include "DescripcioFuncio.h"

DescripcioFuncio::DescripcioFuncio() : Descripcio(Descripcio::Tipus::FUNCIO) {
    this->subprograma = nullptr;
}

DescripcioFuncio::~DescripcioFuncio() {}

void DescripcioFuncio::setTipusRetorn(std::string tipus){
    this->tipusRetorn = tipus;
}

std::string DescripcioFuncio::getTipusRetorn(){
    return this->tipusRetorn;
}

SubProgram *DescripcioFuncio::getSubPrograma() {
	return this->subprograma;
}