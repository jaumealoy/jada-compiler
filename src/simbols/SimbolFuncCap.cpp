#include "SimbolFuncCap.h"
#include "../Driver.h"

SimbolFuncCap::SimbolFuncCap() : Simbol() {}
SimbolFuncCap::~SimbolFuncCap() {}

/**
 * Insereix una funció a la taula de símbols si no existeix
 * funcCap -> ID () : Tipus
 */
void SimbolFuncCap::make(Driver *driver, std::string nom, std::string tipus){
    // Comprovar que nom no està associat a cap entrada de la taula de símbols
    bool trobat = false;

    try {
        driver->ts.consulta(nom);
        trobat = true;
    } catch(TaulaSimbols::NomNoExistent ex) {
        // no s'ha trobat el nom, en aquest cas no és un error
    }

    if(trobat){
        driver->error("nom ja està definit");
        return;
    }

    // Crear una funció sense paràmetres
    DescripcioFuncio d();
}

/**
 * funcCap -> funcContCap ) : Tipus
 */
void SimbolFuncCap::make(Driver *driver, SimbolFuncContCap cap, std::string tipus){
    // La funció ja està inserida a la taula de símbols, però s'ha d'actualitzar el seu tipus
    // de retorn

    Descripcio *d = driver->ts.consulta(cap.getNomFuncio());

    if(d->getTipus() == Descripcio::Tipus::FUNCIO){
        DescripcioFuncio *df = dynamic_cast<DescripcioFuncio*>(d);
        df->setTipusRetorn(tipus);

        // actualitzar l'entrada de la taula de símbols
        driver->ts.actualitza(cap.getNomFuncio(), df);
    }

}

std::string SimbolFuncCap::getNomFuncio(){
    return this->nom;
}