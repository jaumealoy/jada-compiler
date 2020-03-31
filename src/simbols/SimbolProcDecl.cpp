#include "SimbolProcDecl.h"
#include "../Driver.h"


SimbolProcDecl::SimbolProcDecl() : Simbol("ProcDecl") {}

SimbolProcDecl::~SimbolProcDecl(){}

/**
 * procDecl -> M1 proc procCap begin bloc end id M0;
 */
void SimbolProcDecl::make(Driver *driver, SimbolProcCap cap, 
		SimbolBloc bloc, std::string nom, SimbolMarcador salt, SimbolMarcador et){
    // Comprovar que els noms de la capçalera i l'end coincideixen
    if(cap.getNomProcedure() != nom){
        // error (no crític)
        driver->error( error_noms_cap(nom, cap.getNomProcedure()) );
    }

    // Comprovar que no hi ha cap instrucció prohibida al bloc (com pot ser un break)
    if(bloc.conteBreak()){
        // error (crític)
        driver->error(error_break_invalid(), true);
    }

    if(bloc.conteReturn()){
        driver->error(error_sobren_retorn(), true);
    }

    // variables locals de la funció
    driver->ts.surtirBloc();
	driver->code.leaveSubProgram();

    // afegir fills
    this->fills.push_back( driver->addTreeChild(this, "proc") );;
    this->fills.push_back(std::to_string(cap.getNodeId()));
    this->fills.push_back(std::to_string(bloc.getNodeId()));
    this->fills.push_back( driver->addTreeChild(this, "end " + nom + ";") );
    
    Simbol::toDotFile(driver);

	// backpatch al final de l'instrucció
	driver->code.backpatch(et.getLabel(), salt.getSeg());
}