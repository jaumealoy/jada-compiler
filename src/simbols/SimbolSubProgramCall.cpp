#include "SimbolSubProgramCall.h"
#include "SimbolSubProgramContCall.h"
#include "../code/instructions/CallInstruction.h"
#include "../code/instructions/PutParamInstruction.h"
#include "../code/instructions/PreAmbleInstruction.h"
#include "../code/instructions/PreCallInstruction.h"
#include "../code/instructions/SkipInstruction.h"
#include "../code/instructions/AssignmentInstruction.h"

#include "../Driver.h"

SimbolSubProgramCall::SimbolSubProgramCall() : SimbolReferencia() {
    this->nomNode = "SubProgramCall";
}

SimbolSubProgramCall::~SimbolSubProgramCall(){}

/**
 * subProgramCall -> ID ()
 */
void SimbolSubProgramCall::make(Driver *driver, std::string id){

    // Comprovar que id existeix i és una funció o procediment
    Descripcio *d = nullptr;
    try {
        d = driver->ts.consulta(id);
    } catch(TaulaSimbols::NomNoExistent ex) {
        // error! marcar id_nul i ts_nul
        this->makeNull();
        driver->error( error_no_definit(id) );
        return;
    }

    // d != null
    // Comprovar que és una descripció d'una funció o procediment
    if(d->getTipus() != Descripcio::Tipus::FUNCIO && d->getTipus() != Descripcio::Tipus::PROCEDIMENT){
        this->makeNull();
        driver->error( error_no_subprograma(id) );
        return;
    }

    // Comprovar que efectivament aquesta funció no té paràmetres
    TaulaSimbols::Iterator params = driver->ts.getParametres();
    params.first(id);

    if(params.valid()){
        // existeix com a mínim un paràmetre però no s'ha proporcionat
        driver->error( error_falten_parametres() );
        return;
    }

	SubProgram *program = nullptr;

    // si és una funció, assignar el tipus de retorn a la referènca
    if(d->getTipus() == Descripcio::Tipus::FUNCIO){
        DescripcioFuncio *df = (DescripcioFuncio *) d;
        this->tipus = df->getTipusRetorn();

        // i el tipus subjacent bàsic
        Descripcio *dd = driver->ts.consulta(this->tipus);
        
        // segur que és un tipus, sinó s'hauria produït un error a l'hora d'inserir la funció
        DescripcioTipus *dt = (DescripcioTipus *) dd;
        this->tsb = dt->getTSB();

		program = df->getSubPrograma();
    }else{
        // és un procediment, no té valor de retorn
        this->tsb = TipusSubjacentBasic::NUL;
        this->tipus.clear();

		program = ((DescripcioProc *) d)->getSubPrograma();
    }

    this->mode = SimbolReferencia::ModeMVP::CRIDA_COMPLETA;

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, id + "()") );
    Simbol::toDotFile(driver);

    // generacio de codi
	if(d->getTipus() == Descripcio::Tipus::FUNCIO){
		// no té paràmetres, però el valor de retorn és com un paràmetre més
		driver->code.addInstruction(new PreCallInstruction(program));
	}
	
	// si és una funció, té un tipus de retorn
	this->r = nullptr;
	this->d = nullptr;
	if(d->getTipus() == Descripcio::Tipus::FUNCIO){
		this->r = driver->code.addVariable(this->tsb);
	}

    driver->code.addInstruction(new CallInstruction(program, this->r));
}

/**
 * subProgramCall -> subProgramContCall )
 */
void SimbolSubProgramCall::make(Driver *driver, SimbolSubProgramContCall cont){
    if(cont.isNull()){
        // és una referència malformada
        this->makeNull();
        return;
    }
    
    // si el subprograma no existeix ja s'haurà marcat com null o és realment
    // un subprograma

    // Comprovar que no s'esperen més paràmetres
    TaulaSimbols::Iterator tmp = cont.getParametres();
    tmp.next();

    if(tmp.valid()){
        // s'esperen més paràmetres però no s'han proporcionat
        driver->error( error_falten_parametres() );
        this->makeNull();
        return;
    }

    // els paràmetres reals i formals coincideixen
    this->id = cont.getId();
    this->mode = SimbolReferencia::ModeMVP::CRIDA_COMPLETA;

    Descripcio *d = driver->ts.consulta(this->id);
	SubProgram *programa = nullptr;

    // segur que existeix, en cas contrari s'hauria marcat com a nul
    if(d->getTipus() == Descripcio::Tipus::FUNCIO){
        // és una funció, s'ha d'especificar el tipus de retorn
        DescripcioFuncio *df = (DescripcioFuncio *) d;
        this->tipus = df->getTipusRetorn();
		programa = df->getSubPrograma();

        DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(this->tipus);
        this->tsb = dt->getTSB();
    }else{
        // és un procediment
        this->tipus.clear();
        this->tsb = TipusSubjacentBasic::NUL;

		programa = ((DescripcioProc *) d)->getSubPrograma();
    }

    // pintar a l'arbre
    this->fills.push_back( std::to_string(cont.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ")") );
    Simbol::toDotFile(driver);

	// generació de codi
	// posar els paràmetres a la pila
	std::list<struct SimbolSubProgramContCall::ParametreReal> params = cont.getCallParams();
	int size = params.size();

	// reservar espai per tots els paràmetres
	// és la primera instrucció que s'ha d'executar
	Instruction *aux = driver->code.addInstruction(new PreCallInstruction(programa));

	driver->code.move(aux, aux, cont.getInici().getInstruction());
	driver->code.remove(cont.getInici().getInstruction());

	tmp = driver->ts.getParametres();
	tmp.first(this->id);

	for(int i = 0; i < size; i++) {
		DescripcioArgument *da = (DescripcioArgument *) tmp.get();
		struct SimbolSubProgramContCall::ParametreReal parametre = params.front();
		SimbolExpressio valor = parametre.exp;
		params.pop_front();

		if (valor.getTSB() == TipusSubjacentBasic::BOOLEAN) {
			// empilar valors true o false segons correspongui
			Label *caseTrue = driver->code.addLabel();
			Label *caseFalse = driver->code.addLabel();
			Label *end = driver->code.addLabel();

			// variable que conté el valor que es passa per paràmetre
			Variable *resultat = driver->code.addVariable(TipusSubjacentBasic::BOOLEAN);

			// cas true
			Instruction *startI = driver->code.addInstruction(new SkipInstruction(caseTrue));
			driver->code.backpatch(caseTrue, valor.getCert());
			driver->code.addInstruction(new AssignmentInstruction(
				resultat,
				((DescripcioConstant *) driver->ts.consulta("true"))->getVariable()
			));
			driver->code.addInstruction(new GoToInstruction(end));

			// cas false
			driver->code.addInstruction(new SkipInstruction(caseFalse));
			driver->code.backpatch(caseFalse, valor.getFals());
			driver->code.addInstruction(new AssignmentInstruction(
				resultat,
				((DescripcioConstant *) driver->ts.consulta("false"))->getVariable()
			));

			// final d'aquest cas
			driver->code.addInstruction(new SkipInstruction(end));
			Instruction *endI = driver->code.addInstruction(new PutParamInstruction(
				resultat, 
				da->getVariable(), 
				programa
			));

			// moure aquest codi de manera que quedi just abans del pròxim paràmetre
			driver->code.move(
				startI,
				endI,
				parametre.m.getInstruction()
			);

			// i eliminar les instruccions aritificials
			driver->code.remove(parametre.m.getInstruction());
		} else {
			Variable *var = valor.dereference(driver, valor.getTSB());
			driver->code.addInstruction(new PutParamInstruction(var, da->getVariable(), programa));
			driver->code.remove(parametre.m.getInstruction());
		}

		tmp.next();
	}

	this->r = nullptr;
	this->d = nullptr;
	if(d->getTipus() == Descripcio::Tipus::FUNCIO){
		this->r = driver->code.addVariable(this->tsb);
	}

	// invocar el subprograma
	driver->code.addInstruction(new CallInstruction(programa, this->r));
}