#include "DescripcioFuncio.h"

DescripcioFuncio::DescripcioFuncio(SubProgram *programa) : Descripcio(Descripcio::Tipus::FUNCIO) {
    this->subprograma = programa;
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