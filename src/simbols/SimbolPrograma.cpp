#include "SimbolPrograma.h"
#include "../Driver.h"

/**
 * Si s'arriba a aplicar aquesta reducció significa que no s'ha produït 
 * cap error crític
 * 
 * programa -> declList
 */
void SimbolPrograma::make(Driver *driver, SimbolDeclList declList){
    // Comprovar que existeix un procediment anomenat main
    // i que no té paràmetres

    Descripcio *d = nullptr;
    try {
        d = driver->ts.consulta("main");
    } catch(TaulaSimbols::NomNoExistent ex) {
        driver->error(error_no_procediment_principal(), true);
        return;
    }

    // d != nullptr
    if(d->getTipus() != Descripcio::Tipus::PROCEDIMENT){
        driver->error(error_no_procediment_principal(), true);
        return;
    }

    // Comprovar que no té paràmetres
    TaulaSimbols::Iterator it = driver->ts.getParametres();
    it.first("main");

    if(it.valid()){
        driver->error(error_no_procediment_principal(), true);
        return;
    }

    // representar el node a l'arbre
    this->fills.push_back(std::to_string(declList.getNodeId()));
    this->toDotFile(driver);
}

void SimbolPrograma::toDotFile(Driver *driver){
    Simbol::toDotFile(driver);
}

SimbolPrograma::SimbolPrograma() : Simbol("Programa") {}
SimbolPrograma::~SimbolPrograma(){}