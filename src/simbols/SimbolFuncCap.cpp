#include "SimbolFuncCap.h"
#include "../Driver.h"
#include "../code/instructions/PreAmbleInstruction.h"
#include "../code/instructions/SkipInstruction.h"

SimbolFuncCap::SimbolFuncCap() : Simbol("FuncCap") {}
SimbolFuncCap::~SimbolFuncCap() {}

/**
 * Insereix una funció a la taula de símbols si no existeix
 * funcCap -> ID () : Tipus
 */
void SimbolFuncCap::make(Driver *driver, std::string nom, SimbolTipus tipus){
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

    std::string nomTipus = tipus;

    // Comprovar que no es retorna un array i que el tipus existeix
	DescripcioTipus *dtt;
    try {
        Descripcio *dt = driver->ts.consulta(nomTipus);
        
        if(dt->getTipus() != Descripcio::Tipus::TIPUS){
            driver->error(error_no_tipus(nomTipus), true);
            return;
        }

        dtt = (DescripcioTipus *) dt;
        if(dtt->getTSB() == TipusSubjacentBasic::ARRAY){
            // error, no es poden retornar arrays
            driver->error( error_retorn_array() );
            return;
        } 
    } catch (TaulaSimbols::NomNoExistent ex) {
        // no existeix el tipus
        driver->error(error_no_definit(tipus), true);
        return;
    }

	// crear el procedure a la generació de codi
	Label start = driver->code.addLabel(nom);
	SubProgram *subprogram = driver->code.addSubProgram(nom, start);
	subprogram->setTipusRetorn(dtt->getTSB());

	// indicar l'etiqueta d'inici del subprograma
	driver->code.addInstruction(new SkipInstruction(start));

    // Crear una funció sense paràmetres
    DescripcioFuncio *d = new DescripcioFuncio(subprogram);
    d->setTipusRetorn(tipus);
    
    // inserir la funció
    driver->ts.posar(nom, d);

    // i entrar bloc
    driver->ts.entrarBloc();

    this->nom = nom;

	// entrar al subprograma (generació de codi)
	driver->code.enterSubProgram(subprogram);
	driver->code.addInstruction(new PreAmbleInstruction(subprogram));

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, nom + "() : ") );
    this->fills.push_back( std::to_string(tipus.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * funcCap -> funcContCap ) : Tipus
 */
void SimbolFuncCap::make(Driver *driver, SimbolFuncContCap cap, SimbolTipus tipus){
    // La funció ja està inserida a la taula de símbols, però s'ha d'actualitzar el seu tipus
    // de retorn

    Descripcio *d = driver->ts.consulta(cap.getNomFuncio());
	DescripcioFuncio *df;
    if(d->getTipus() == Descripcio::Tipus::FUNCIO){
        df = (DescripcioFuncio *) d;
        df->setTipusRetorn(tipus);

        // actualitzar l'entrada de la taula de símbols
        // hem modificat el contingut d'un punter, no importa
        // actualitzar res més

		// i indicar el tipus de retorn a la generació de codi
		DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(tipus);
		if(dt->getTSB() == TipusSubjacentBasic::ARRAY){
            // error, no es poden retornar arrays
            driver->error( error_retorn_array() );
            return;
        }

		df->getSubPrograma()->setTipusRetorn(dt->getTSB());
    }

    this->nom = cap.getNomFuncio();

    // entrar bloc i definir variables locals
    driver->ts.entrarBloc();

	// entrar al subprograma (generació de codi)
	driver->code.enterSubProgram(df->getSubPrograma());
	driver->code.addInstruction(new PreAmbleInstruction(df->getSubPrograma()));

    TaulaSimbols::Iterator it = driver->ts.getParametres();
    it.first(this->nom);

    while(it.valid()){
        DescripcioArgument *da = (DescripcioArgument *) it.get();
        Descripcio *d = nullptr;

		// obtenció del TSB de la variable
		DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(da->getNomTipusArgument());
		Variable *var = driver->code.addVariable(dt->getTSB(), it.getId(), true);

		df->getSubPrograma()->addParameter(var);
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

        driver->ts.posar(it.getId(), d);
        it.next();
    }

    // pintar a l'arbre
    this->fills.push_back( std::to_string(cap.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, " ) : ") );
    this->fills.push_back( std::to_string(tipus.getNodeId()) );
    Simbol::toDotFile(driver);
}

std::string SimbolFuncCap::getNomFuncio(){
    return this->nom;
}