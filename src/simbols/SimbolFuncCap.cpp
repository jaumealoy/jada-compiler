#include "SimbolFuncCap.h"
#include "../Driver.h"

SimbolFuncCap::SimbolFuncCap() : Simbol() {}
SimbolFuncCap::~SimbolFuncCap() {}

// TODO: impedir que es puguin retornar arrays

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
    DescripcioFuncio *d = new DescripcioFuncio();
    d->setTipusRetorn(tipus);
    
    // inserir la funció
    driver->ts.posar(nom, d);

    // i entrar bloc
    driver->ts.entrarBloc();

    this->nom = nom;
}

/**
 * funcCap -> funcContCap ) : Tipus
 */
void SimbolFuncCap::make(Driver *driver, SimbolFuncContCap cap, std::string tipus){
    // La funció ja està inserida a la taula de símbols, però s'ha d'actualitzar el seu tipus
    // de retorn

    Descripcio *d = driver->ts.consulta(cap.getNomFuncio());

    if(d->getTipus() == Descripcio::Tipus::FUNCIO){
        DescripcioFuncio *df = (DescripcioFuncio *) d;
        df->setTipusRetorn(tipus);

        // actualitzar l'entrada de la taula de símbols
        // hem modificat el contingut d'un punter, no importa
        // actualitzar res més
    }

    this->nom = cap.getNomFuncio();

    // entrar bloc i definir variables locals
    driver->ts.entrarBloc();

    TaulaSimbols::Iterator it = driver->ts.getParametres();
    it.first(this->nom);

    while(it.valid()){
        DescripcioArgument *da = (DescripcioArgument *) it.get();
        DescripcioVariable *dv = new DescripcioVariable(da->getNomTipusArgument());
        std::cout << "Definint " << it.getId() << " com a variable local de " << this->nom << std::endl;
        driver->ts.posar(it.getId(), dv);
        it.next();
    }
}

std::string SimbolFuncCap::getNomFuncio(){
    return this->nom;
}