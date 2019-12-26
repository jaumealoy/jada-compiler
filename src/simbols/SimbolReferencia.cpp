#include "SimbolReferencia.h"
#include "../Driver.h"

SimbolReferencia::SimbolReferencia(){}
SimbolReferencia::~SimbolReferencia(){}

/**
 * referencia -> ID
 */
void SimbolReferencia::make(Driver *driver, std::string nom){
    // Comprovar que nom existeix a la taula de símbols
    Descripcio *d = nullptr;

    try {
        d = driver->ts.consulta(nom);
    } catch (TaulaSimbols::NomNoExistent ex) {
        // error! no existeix aquest nom
        driver->error(nom + " no reconegut");
    }

    // Comprovar que és una variable o constant
    if(d->getTipus() != Descripcio::VARIABLE && d->getTipus() != Descripcio::CONSTANT) {
        driver->error("error, no és una variable ni una constants");
        
        // Indicar id nul
        this->id.clear();
    }

    // Obtenir els tipus de la constant i el subjacent bàsic
    

}

void SimbolReferencia::makeNull(){
    this->tsb = TipusSubjacentBasic::NUL;
    this->id.clear();
}

bool SimbolReferencia::isNull(){
    return this->tsb == TipusSubjacentBasic::NUL && this->id.empty();
}

std::string SimbolReferencia::getId(){
    return this->id;
}