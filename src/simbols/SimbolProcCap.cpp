#include "SimbolProcCap.h"
#include "../Driver.h"

SimbolProcCap::SimbolProcCap() : Simbol() {}
SimbolProcCap::~SimbolProcCap() {}

// TODO: impedir que es puguin retornar arrays
// TODO: entrarBloc i definir variables com a variables locals

/**
 * Insereix un procedure a la taula de símbols si no existeix
 * ProcCap -> ID ()
 */
void SimbolProcCap::make(Driver *driver, std::string nom){
    // Comprovar que nom no està associat a cap entrada de la taula de símbols
    bool trobat = false;

    try {
        driver->ts.consulta(nom);
        trobat = true;
    } catch(TaulaSimbols::NomNoExistent ex) {
        // no s'ha trobat el nom, en aquest cas no és un error
    }

    if(trobat){
        driver->error("nom del procedure ja definit");
        return;
    }

    // Crear un procedure sense paràmetres
    DescripcioProc *d = new DescripcioProc();
    
    // inserir el procedure
    driver->ts.posar(nom, d);

    this->nom = nom;
}

/**
 * ProcCap -> ProcContCap )
 */
void SimbolProcCap::make(Driver *driver, SimbolProcContCap cap){

    this->nom = cap.getNomProcedure();
}

std::string SimbolProcCap::getNomProcedure(){
    return this->nom;
}