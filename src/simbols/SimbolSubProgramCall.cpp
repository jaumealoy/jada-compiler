#include "SimbolSubProgramCall.h"
#include "SimbolSubProgramContCall.h"

#include "../Driver.h"

SimbolSubProgramCall::SimbolSubProgramCall() : SimbolReferencia() {

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

    // si és una funció, assignar el tipus de retorn a la referènca
    if(d->getTipus() == Descripcio::Tipus::FUNCIO){
        DescripcioFuncio *df = (DescripcioFuncio *) d;
        this->tipus = df->getTipusRetorn();

        // i el tipus subjacent bàsic
        d = driver->ts.consulta(this->tipus);
        
        // segur que és un tipus, sinó s'hauria produït un error a l'hora d'inserir la funció
        DescripcioTipus *dt = (DescripcioTipus *) d;
        this->tsb = dt->getTSB();
    }else{
        // és un procediment, no té valor de retorn
        this->tsb = TipusSubjacentBasic::NUL;
        this->tipus.clear();
    }

    this->mode = SimbolReferencia::ModeMVP::CRIDA_COMPLETA;

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, id + "()") );
    Simbol::toDotFile(driver);
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
    // segur que existeix, en cas contrari s'hauria marcat com a nul
    if(d->getTipus() == Descripcio::Tipus::FUNCIO){
        // és una funció, s'ha d'especificar el tipus de retorn
        DescripcioFuncio *df = (DescripcioFuncio *) d;
        this->tipus = df->getTipusRetorn();

        DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(this->tipus);
        this->tsb = dt->getTSB();
    }else{
        // és un procediment
        this->tipus.clear();
        this->tsb = TipusSubjacentBasic::NUL;
    }

    // pintar a l'arbre
    this->fills.push_back( std::to_string(cont.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ")") );
    Simbol::toDotFile(driver);
}