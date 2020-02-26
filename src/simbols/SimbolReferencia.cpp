#include "SimbolReferencia.h"
#include "SimbolTipusArray.h"
#include "SimbolSubProgramCall.h"
#include "../Driver.h"

SimbolReferencia::SimbolReferencia() : Simbol("Referencia"){}
SimbolReferencia::~SimbolReferencia(){}

/**
 * referencia -> ID
 */
void SimbolReferencia::make(Driver *driver, std::string nom){
    // Comprovar que nom existeix a la taula de símbols
    Descripcio *d = nullptr;

    try {
        d = driver->ts.consulta(nom);
    } catch (TaulaSimbols::NomNoExistent ex) {
        // error! no existeix aquest nom
        driver->error(nom + " no reconegut");
        this->makeNull();
        return;
    }

    // Obtenir els tipus de la constant i el subjacent bàsic
    std::string tipus;

    if(d->getTipus() == Descripcio::Tipus::VARIABLE){
        DescripcioVariable *dv = (DescripcioVariable *) d;
        tipus = dv->getNomTipus();
        this->mode = SimbolReferencia::ModeMVP::VAR;
    }else if(d->getTipus() == Descripcio::Tipus::CONSTANT){
        DescripcioConstant *dc = (DescripcioConstant *) d;
        tipus = dc->getNomTipus();
        this->mode = SimbolReferencia::ModeMVP::CONST;
    }else{
        // no és una constant ni una variable
        driver->error( error_no_posicio_memoria(nom) );
        this->makeNull();
        return;
    }
    
    // obtenir el tipus subjacent bàsic
    // segur que serà una descripció de tipus
    DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(tipus);

    this->tipus = tipus;
    this->tsb = dt->getTSB();
    this->id = nom;

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, nom) );
    Simbol::toDotFile(driver);

	// s'accedeix a una variable, desplaçament és 0
	this->d = 0;
}

/**
 * referencia -> array
 */
void SimbolReferencia::make(Driver *driver, SimbolTipusArray array){
    if(!array.isReferencia() || array.isNull()){
        this->makeNull();
        driver->error("No referència", true);
        return;
    }

    // és una refereǹcia a un array vàlida
    this->tsb = array.getTSB();
    this->tipus = array.getTipus();
    this->id = array.getId();
    this->mode = array.getMode();

    // i pintar a l'arbre
    this->fills.push_back( std::to_string(array.getNodeId()) );
    Simbol::toDotFile(driver);

	// TODO: el desplaçament representa el número d'element que es vol consultar
	if(array.isAccessConstant()){
		this->d = array.d;
	}
}


/**
 * referencia -> subProgramCall
 */
void SimbolReferencia::make(Driver *driver, SimbolSubProgramCall call){
    if(call.isNull()){
        this->makeNull();
        return;
    }

    this->tsb = call.getTSB();
    this->tipus = call.getTipus();
    this->mode = SimbolReferencia::ModeMVP::CRIDA_COMPLETA;

    // i pintar a l'arbre
    this->fills.push_back( std::to_string(call.getNodeId()) );
    Simbol::toDotFile(driver);
}

void SimbolReferencia::makeNull(){
    this->tsb = TipusSubjacentBasic::NUL;
    this->id.clear();
}

bool SimbolReferencia::isNull(){
    return this->tsb == TipusSubjacentBasic::NUL && this->id.empty();
}

std::string SimbolReferencia::getId(){
    return this->id;
}

TipusSubjacentBasic SimbolReferencia::getTSB(){
    return this->tsb;
}

SimbolReferencia::ModeMVP SimbolReferencia::getMode(){
    return this->mode;
}

std::string SimbolReferencia::getTipus(){
    return this->tipus;
}

int SimbolReferencia::getOffset(){
	return this->d;
}

int SimbolReferencia::getReferencia(){
	return this->r;
}