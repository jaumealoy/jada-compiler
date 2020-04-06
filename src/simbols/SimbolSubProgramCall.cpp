#include "SimbolSubProgramCall.h"
#include "SimbolSubProgramContCall.h"
#include "../code/instructions/CallInstruction.h"
#include "../code/instructions/PutParamInstruction.h"
#include "../code/instructions/PreAmbleInstruction.h"
#include "../code/instructions/AssemblyInstruction.h"

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
        d = driver->ts.consulta(this->tipus);
        
        // segur que és un tipus, sinó s'hauria produït un error a l'hora d'inserir la funció
        DescripcioTipus *dt = (DescripcioTipus *) d;
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
    driver->code.addInstruction(new CallInstruction(program));
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
	std::list<SimbolExpressio> params = cont.getCallParams();
	int size = params.size();

	// reservar espai per tots els paràmetres
	int espai = programa->getOcupacioParametres();
	driver->code.addInstruction(new AssemblyInstruction(
		"subq\t$" + std::to_string(espai) + ", %" + CodeGeneration::getRegister(CodeGeneration::Register::SP, 8)
	));

	tmp = driver->ts.getParametres();
	tmp.first(this->id);

	for(int i = 0; i < size; i++) {
		DescripcioArgument *da = (DescripcioArgument *) tmp.get();
		SimbolExpressio valor = params.back();
		params.pop_back();

		if (valor.getTSB() == TipusSubjacentBasic::BOOLEAN) {
			// TODO: empilar valors true o false segons correspongui
		} else {
			Variable *var = valor.dereference(driver, valor.getTSB());
			driver->code.addInstruction(new PutParamInstruction(var, da->getVariable(), programa));
		}

		tmp.next();
	}


	// invocar el subprograma
	driver->code.addInstruction(new CallInstruction(programa));

}