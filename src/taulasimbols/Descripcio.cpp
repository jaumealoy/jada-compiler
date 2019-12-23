#include "Descripcio.h"

Descripcio::Descripcio() : Descripcio(Descripcio::Tipus::NUL){

}

Descripcio::Descripcio(Descripcio::Tipus type){
    this->type = type;
}

Descripcio::~Descripcio(){
    
}

Descripcio::Tipus Descripcio::getTipus(){
    return this->type;
}