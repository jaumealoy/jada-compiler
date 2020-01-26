#include "DescripcioFuncio.h"

int DescripcioFuncio::numFuncio = 0;

DescripcioFuncio::DescripcioFuncio() : Descripcio(Descripcio::Tipus::FUNCIO) {
    this->nf = DescripcioFuncio::numFuncio++;
}

DescripcioFuncio::~DescripcioFuncio() {}

void DescripcioFuncio::setTipusRetorn(std::string tipus){
    this->tipusRetorn = tipus;
}

std::string DescripcioFuncio::getTipusRetorn(){
    return this->tipusRetorn;
}