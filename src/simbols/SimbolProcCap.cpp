#include "SimbolProcCap.h"
#include "../Driver.h"

SimbolProcCap::SimbolProcCap() : Simbol("ProcCap") {}
SimbolProcCap::~SimbolProcCap() {}

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

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, nom + "()") );
    Simbol::toDotFile(driver);
}

/**
 * ProcCap -> ProcContCap )
 */
void SimbolProcCap::make(Driver *driver, SimbolProcContCap cap){
    this->nom = cap.getNomProcedure();

    // pintar a l'arbre
    this->fills.push_back( std::to_string(cap.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, " )") );
    Simbol::toDotFile(driver);
}

std::string SimbolProcCap::getNomProcedure(){
    return this->nom;
}