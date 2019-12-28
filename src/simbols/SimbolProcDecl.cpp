#include "SimbolProcDecl.h"
#include "../Driver.h"


SimbolProcDecl::SimbolProcDecl() : Simbol("ProcDecl") {

}

SimbolProcDecl::~SimbolProcDecl(){

}

/**
 * procDecl -> proc procCap begin bloc end id;
 */
void SimbolProcDecl::make(Driver *driver, SimbolProcCap cap, SimbolBloc bloc, std::string nom){
    // Comprovar que els noms de la capçalera i l'end coincideixen
    if(cap.getNomProcedure() != nom){
        // error (no crític)
        driver->error("s'ha trobat " + nom + " i s'esperava " + cap.getNomProcedure());
    }

    // Comprovar que no hi ha cap instrucció prohibida al bloc (com pot ser un break)
    if(bloc.conteBreak()){
        // error (crític)
        driver->error("un break només ha d'estar dins un while");
    }

    if(bloc.conteReturn()){
        driver->error("Un procedure no ha de tenir return");
    }

    // afegir fills
    this->fills.push_back( driver->addTreeChild(this, "proc") );;
    this->fills.push_back(std::to_string(cap.getNodeId()));
    this->fills.push_back(std::to_string(bloc.getNodeId()));
    this->fills.push_back( driver->addTreeChild(this, "end " + nom + ";") );
    
    Simbol::toDotFile(driver);
}