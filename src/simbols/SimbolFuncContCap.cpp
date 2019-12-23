#include "SimbolFuncContCap.h"
#include "../Driver.h"

/**
 * Crea una funció (sense tipus de retorn) i afegeix un paràmetre
 * funcContCap -> ID ( Tipus ID
 */
void SimbolFuncContCap::make(Driver *driver, std::string nomFuncio, std::string tipus, std::string nomParametre){
    // comprovar que el nom de la funció no està utilitzat
    bool trobat = false;
    try {
        driver->ts.consulta(nomFuncio);
        trobat = true;
    }catch(TaulaSimbols::NomNoExistent ex){
        // el nom no existeix, no és un error
    }

    if(trobat){
        driver->error("nom ja definit");
        return;
    }

    // comprovar que tipus és efectivament un tipus vàlid
    Descripcio *d = nullptr;
    try {
        d = driver->ts.consulta(tipus);
        
        if(d->getTipus() != Descripcio::Tipus::TIPUS){
            // error! s'esperava un tipus
            driver->error("s'esperava un tipus");
        }
    } catch(TaulaSimbols::NomNoExistent ex) {
        driver->error("nom no reconegut");
    }

    // TODO: revisar aquest pensament
    // és el primer paràmetre, segur que no n'hi ha cap altre
    
}

void SimbolFuncContCap::make(Driver *driver, std::string tipus, std::string nomParametre){

}

std::string SimbolFuncContCap::getNomFuncio(){
    return this->nomFuncio;
}