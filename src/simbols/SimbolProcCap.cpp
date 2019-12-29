#include "SimbolProcCap.h"
#include "../Driver.h"

SimbolProcCap::SimbolProcCap() : Simbol("ProcCap") {}
SimbolProcCap::~SimbolProcCap() {}

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
        driver->error( error_redefinicio(nom) );
        return;
    }

    // Crear un procedure sense paràmetres
    DescripcioProc *d = new DescripcioProc();
    
    // inserir el procedure
    driver->ts.posar(nom, d);

    this->nom = nom;

    // entrar bloc
    driver->ts.entrarBloc();

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, nom + "()") );
    Simbol::toDotFile(driver);
}

/**
 * ProcCap -> ProcContCap )
 */
void SimbolProcCap::make(Driver *driver, SimbolProcContCap cap){
    this->nom = cap.getNomProcedure();

    // entrar bloc i definir paràmetres
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

    // pintar a l'arbre
    this->fills.push_back( std::to_string(cap.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, " )") );
    Simbol::toDotFile(driver);
}

std::string SimbolProcCap::getNomProcedure(){
    return this->nom;
}