#include "SimbolProcContCap.h"
#include "../Driver.h"

SimbolProcContCap::SimbolProcContCap() : Simbol() {}
SimbolProcContCap::~SimbolProcContCap() {}

/**
 * Crea un procedure i afegeix un paràmetre
 * ProcContCap -> ID ( Tipus ID
 */
void SimbolProcContCap::make(Driver *driver, std::string nomFuncio, std::string tipus, std::string nomParametre){
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
        driver->error(tipus + " no reconegut");
        // ERROR
    }

    // Inserir el procedure a la taula de símbols
    DescripcioProc *df = new DescripcioProc();
    driver->ts.posar(nomFuncio, df);

    this->nomProcedure = nomFuncio;

    // TODO: revisar aquest pensament
    // és el primer paràmetre, segur que no n'hi ha cap altre
    
    // si el tipus és un array, serà passat per referència (mode in-out)
    DescripcioArgument *arg = new DescripcioArgument(tipus, DescripcioArgument::Tipus::IN);
    DescripcioTipus *dt = (DescripcioTipus *) d;
    if(dt->getTipus() == DescripcioTipus::Tipus::ARRAY){
        arg->setTipusArgument(DescripcioArgument::Tipus::IN_OUT);
    }

    driver->ts.posarParam(nomFuncio, nomParametre, arg);    
}

/**
 * Afegeix un paràmetre al procedure indicada per ProcContCap
 * ProcContCap -> ProcContCap , Tipus ID
 **/
void SimbolProcContCap::make(Driver *driver, SimbolProcContCap cap, std::string tipus, std::string nomParametre){
    // és un procedure que està inserit a la taula de símbols (no importa comprovar
    // que realment existeix)
    // és possible que ja existeixi paràmetre amb aquest no (error quan s'insereixi)
    
    // comprovar que tipus és un tipus
    Descripcio *d = nullptr;
    try {
        d = driver->ts.consulta(tipus);
        if(d->getTipus() != Descripcio::Tipus::TIPUS){
            // error! s'esperava un tipus
            driver->error("s'esperava un tipus");
        }
    } catch (TaulaSimbols::NomNoExistent ex) {
        // no existeix!
        driver->error(tipus + " no reconegut");
    }

    // si el tipus és un array, serà passat per referència (mode in-out)
    DescripcioArgument *arg = new DescripcioArgument(tipus, DescripcioArgument::Tipus::IN);
    DescripcioTipus *dt = (DescripcioTipus *) d;
    if(dt->getTipus() == DescripcioTipus::Tipus::ARRAY){
        arg->setTipusArgument(DescripcioArgument::Tipus::IN_OUT);
    }

    try {
        driver->ts.posarParam(cap.getNomProcedure(), nomParametre, arg);
    } catch (TaulaSimbols::NomExistent ex) {
        driver->error("la funció ja té definit aquest paràmetre");
    }

    // s'ha de passar el nom a les altres produccions
    this->nomProcedure = cap.getNomProcedure();
}

std::string SimbolProcContCap::getNomProcedure(){
    return this->nomProcedure;
}