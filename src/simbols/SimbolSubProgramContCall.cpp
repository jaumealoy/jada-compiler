#include "SimbolSubProgramContCall.h"
#include "../Driver.h"

SimbolSubProgramContCall::SimbolSubProgramContCall() : SimbolReferencia() {
    this->nomNode = "SubProgramContCall";
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
        driver->error( error_no_definit(id) );
        return;
    }

    // d != null
    if(d->getTipus() != Descripcio::Tipus::FUNCIO && d->getTipus() != Descripcio::Tipus::PROCEDIMENT){
        this->makeNull();
        driver->error( error_no_subprograma(id) );
        return;
    }

    // Comprovar si els paràmetres reals són compatibles amb els formals
    this->it = driver->ts.getParametres();
    this->it.first(id);

    if(!this->it.valid()){
        // no s'esperen paràmetres
        this->makeNull();
        driver->error(error_sobren_parametres());
        return;
    }

    DescripcioArgument *arg = (DescripcioArgument *) this->it.get();

    // Comprovar si el mode de l'expressió és compatible amb el del paràmetre
    if(arg->getTipusArgument() == DescripcioArgument::Tipus::IN_OUT && exp.getMode() == SimbolExpressio::Mode::CONST){
        // no és possible modificar una constant
        driver->error( error_es_constant("") );
        this->makeNull();
        return;
    }
    
    if(exp.getTipus().empty()){
        // tipus anònim, comprovar el tipus subjacent bàsic
        DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(arg->getNomTipusArgument());
        if(exp.getTSB() != dt->getTSB()){
            // no són compatibles
            driver->error( error_tipus_no_compatibles(arg->getNomTipusArgument()) );
            this->makeNull();
            return;
        }
    }else{
        // els paràmetres formals tenen un tipus
        if(arg->getNomTipusArgument() != exp.getTipus()){
            // no són del mateix tipus
            driver->error( error_tipus_no_compatibles(arg->getNomTipusArgument(), exp.getTipus()) );
            this->makeNull();
            return;
        }
    }

    // El primer paràmetre és del tipus que toca
    this->id = id;
    this->mode = SimbolReferencia::ModeMVP::CRIDA_INCOMPLETA;

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, id + "(") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    Simbol::toDotFile(driver);
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
        driver->error( error_sobren_parametres() );
        return;
    }

    // comprovar el tipus del paràmetre
    DescripcioArgument *arg = (DescripcioArgument *) this->it.get();

    // Comprovar si el mode de l'expressió és compatible amb el del paràmetre
    if(arg->getTipusArgument() == DescripcioArgument::Tipus::IN_OUT && exp.getMode() == SimbolExpressio::Mode::CONST){
        // no és possible modificar una constant
        driver->error( error_es_constant("") );
        this->makeNull();
        return;
    }
    
    if(exp.getTipus().empty()){
        // tipus anònim, comprovar el tipus subjacent bàsic
        DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(arg->getNomTipusArgument());
        if(exp.getTSB() != dt->getTSB()){
            // no són compatibles
            driver->error( error_tipus_no_compatibles(arg->getNomTipusArgument()) );
            this->makeNull();
            return;
        }
    }else{
        // els paràmetres formals tenen un tipus
        if(arg->getNomTipusArgument() != exp.getTipus()){
            // no són del mateix tipus
            driver->error( error_tipus_no_compatibles(arg->getNomTipusArgument(), exp.getTipus()) );
            this->makeNull();
            return;
        }
    }

    // el paràmetre és compatible
    this->id = cont.id;
    this->mode = SimbolReferencia::ModeMVP::CRIDA_INCOMPLETA;

    // pintar a l'arbre
    this->fills.push_back( std::to_string(cont.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ",") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    Simbol::toDotFile(driver);
}


TaulaSimbols::Iterator SimbolSubProgramContCall::getParametres(){
    return this->it;
}
