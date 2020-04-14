#include "SimbolProcDecl.h"
#include "../code/instructions/ReturnInstruction.h"
#include "../code/instructions/SkipInstruction.h"
#include "../Driver.h"

SimbolProcDecl::SimbolProcDecl() : Simbol("ProcDecl") {}

SimbolProcDecl::~SimbolProcDecl(){}

/**
 * procDecl -> M1 proc procCap begin bloc end id M0;
 */
void SimbolProcDecl::make(Driver *driver, SimbolProcCap cap, 
		SimbolBloc bloc, std::string nom, SimbolMarcador salt){
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

	// afegir retorn del subprograma
	SubProgram *programa = ((DescripcioProc *) driver->ts.consulta(cap.getNomProcedure()))->getSubPrograma();
	driver->code.addInstruction(new ReturnInstruction(programa));

	// backpatch al final de l'instrucció
	Label *finalPrograma = driver->code.addLabel();
	driver->code.addInstruction(new SkipInstruction(finalPrograma));
	driver->code.backpatch(finalPrograma, salt.getSeg());
}