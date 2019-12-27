#include "SimbolSubProgramContCall.h"
#include "../Driver.h"

SimbolSubProgramContCall::SimbolSubProgramContCall() : SimbolReferencia() {

}

SimbolSubProgramContCall::~SimbolSubProgramContCall() {}

/**
 * subProgramContCall -> ID ( exprSimple
 */
void SimbolSubProgramContCall::make(Driver *driver, std::string id, SimbolExpressio exp){
    // Comprovar que el subprograma existeix
    Descripcio *d = nullptr;
    try {
        d = driver->ts.consulta(id);
    } catch (TaulaSimbols::NomNoExistent ex) {
        // no existeix el subprograma
        this->makeNull();
        driver->error("no existeix");
        return;
    }

    // d != null
    // TODO: també pot ser un procediment
    if(d->getTipus() != Descripcio::Tipus::FUNCIO && !false){
        this->makeNull();
        driver->error("no és un subprograma");
        return;
    }

    // Comprovar si els paràmetres reals són compatibles amb els formals
    this->it = driver->ts.getParametres();
    this->it.first(id);

    if(!this->it.valid()){
        // no s'esperen paràmetres
        driver->error("aquest subprograma no espera paràmetres");
        return;
    }

    DescripcioArgument *arg = (DescripcioArgument *) this->it.get();

    // Comprovar si el mode de l'expressió és compatible amb el del paràmetre
    if(arg->getTipusArgument() == DescripcioArgument::Tipus::IN_OUT && exp.getMode() == SimbolExpressio::Mode::CONST){
        // no és possible modificar una constant
        driver->error("expressió constant i no ho pot ser");
        this->makeNull();
        return;
    }
    
    if(exp.getTipus().empty()){
        // tipus anònim, comprovar el tipus subjacent bàsic
        DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(arg->getNomTipusArgument());
        if(exp.getTSB() != dt->getTSB()){
            // no són compatibles
            driver->error("tipus no compatible");
            this->makeNull();
            return;
        }
    }else{
        // els paràmetres formals tenen un tipus
        if(arg->getNomTipusArgument() != exp.getTipus()){
            // no són del mateix tipus
            driver->error("tipus no compatible");
            this->makeNull();
            return;
        }
    }

    // El primer paràmetre és del tipus que toca
    this->id = id;
    this->mode = SimbolReferencia::ModeMVP::CRIDA_INCOMPLETA;
}

/**
 * subProgramContCall -> subProgramContCall , exprSimple
 */
void SimbolSubProgramContCall::make(Driver *driver, SimbolSubProgramContCall cont, SimbolExpressio exp){
    if(cont.isNull()){
        this->makeNull();
        return;
    }

    // el subprograma existeix i té un paràmetre
    
    // Comprovar que s'esperen més paràmetres
    this->it = cont.it;
    this->it.next();

    if(!this->it.valid()){
        // no s'esperen més paràmetres però s'ha introduit un paràmetre més
        this->makeNull();
        driver->error("no s'esperen més paràmetres");
        return;
    }

    // comprovar el tipus del paràmetre
    DescripcioArgument *arg = (DescripcioArgument *) this->it.get();

    // Comprovar si el mode de l'expressió és compatible amb el del paràmetre
    if(arg->getTipusArgument() == DescripcioArgument::Tipus::IN_OUT && exp.getMode() == SimbolExpressio::Mode::CONST){
        // no és possible modificar una constant
        driver->error("expressió constant i no ho pot ser");
        this->makeNull();
        return;
    }
    
    if(exp.getTipus().empty()){
        // tipus anònim, comprovar el tipus subjacent bàsic
        DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(arg->getNomTipusArgument());
        if(exp.getTSB() != dt->getTSB()){
            // no són compatibles
            driver->error("tipus no compatible");
            this->makeNull();
            return;
        }
    }else{
        // els paràmetres formals tenen un tipus
        if(arg->getNomTipusArgument() != exp.getTipus()){
            // no són del mateix tipus
            driver->error("tipus no compatible");
            this->makeNull();
            return;
        }
    }

    // el paràmetre és compatible
    this->id = cont.id;
    this->mode = SimbolReferencia::ModeMVP::CRIDA_INCOMPLETA;
}


TaulaSimbols::Iterator SimbolSubProgramContCall::getParametres(){
    return this->it;
}