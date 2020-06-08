#include "SimbolProcCap.h"
#include "../code/instructions/SkipInstruction.h"
#include "../code/instructions/PreAmbleInstruction.h"
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

	// crear el procedure a la generació de codi
	Label *start = driver->code.addLabel(nom);
	SubProgram *subprogram = driver->code.addSubProgram(nom, start);

	// indicar l'etiqueta d'inici del subprograma
	driver->code.addInstruction(new SkipInstruction(start));
    
	// Crear un procedure sense paràmetres
    DescripcioProc *d = new DescripcioProc(subprogram);
    
    // i també inserir el procedure a la taula de símbols
    driver->ts.posar(nom, d);

    this->nom = nom;

    // entrar bloc
    driver->ts.entrarBloc();

	// entrar al subprograma (generació de codi)
	driver->code.enterSubProgram(subprogram);
	driver->code.addInstruction(new PreAmbleInstruction(subprogram));

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

	// entrar al subprograma (generació de codi)
	DescripcioProc *dp = (DescripcioProc *) driver->ts.consulta(this->nom);
	driver->code.enterSubProgram(dp->getSubPrograma());
	driver->code.addInstruction(new PreAmbleInstruction(dp->getSubPrograma()));

    TaulaSimbols::Iterator it = driver->ts.getParametres();
    it.first(this->nom);

	int ocupacioParametres = 0;
    while(it.valid()){
        DescripcioArgument *da = (DescripcioArgument *) it.get();
        Descripcio *d = nullptr;

		// obtenció del TSB de la variable
		DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(da->getNomTipusArgument());
		Variable *var = driver->code.addVariable(dt->getTSB(), it.getId(), true);

		dp->getSubPrograma()->addParameter(var);
		da->setVariable(var);

        if(da->getTipusArgument() == DescripcioArgument::Tipus::IN){
            DescripcioConstant *dv = new DescripcioConstant(da->getNomTipusArgument());
            d = (Descripcio *) dv;
			dv->setVariable(var);
        }else if(da->getTipusArgument() == DescripcioArgument::Tipus::IN_OUT || da->getTipusArgument() == DescripcioArgument::Tipus::VALOR){
            DescripcioVariable *dv = new DescripcioVariable(da->getNomTipusArgument());
            d = (Descripcio *) dv;
			dv->setVariable(var);
        }

            std::cout << "AFEGINT 1 PARÀMETRES = " << it.getId() << std::endl;

        driver->ts.posar(it.getId(), d);
            std::cout << "AFEGINT 2 PARÀMETRES" << std::endl;

        it.next();

            std::cout << "AFEGINT 0 PARÀMETRES" << std::endl;

    }

    std::cout << "AFEGIT PARÀMETRES" << std::endl;

    // pintar a l'arbre
    this->fills.push_back( std::to_string(cap.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, " )") );
    Simbol::toDotFile(driver);
}

std::string SimbolProcCap::getNomProcedure(){
    return this->nom;
}