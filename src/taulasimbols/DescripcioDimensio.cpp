#include "DescripcioDimensio.h"

DescripcioDimensio::DescripcioDimensio(int dimensio) : Descripcio(Descripcio::Tipus::DIMENSIO) {
    this->dimensio = dimensio;
}

DescripcioDimensio::~DescripcioDimensio(){

}

int DescripcioDimensio::getDimensio(){
    return this->dimensio;
}