#include "SimbolProcContCap.h"
#include "../Driver.h"

SimbolProcContCap::SimbolProcContCap() : Simbol("ProcContCap") {}
SimbolProcContCap::~SimbolProcContCap() {}

/**
 * Crea un procedure i afegeix un paràmetre
 * ProcContCap -> ID ( Tipus ID
 */
void SimbolProcContCap::make(Driver *driver, std::string nomFuncio, SimbolArgType constant, SimbolTipus tipus, std::string nomParametre){
    // comprovar que el nom de la funció no està utilitzat
    bool trobat = false;
    try {
        driver->ts.consulta(nomFuncio);
        trobat = true;
    }catch(TaulaSimbols::NomNoExistent ex){
        // el nom no existeix, no és un error
    }

    if(trobat){
        driver->error( error_redefinicio(nomFuncio) );
        return;
    }

    // comprovar que tipus és efectivament un tipus vàlid
    Descripcio *d = nullptr;
    TipusSubjacentBasic tsb = TipusSubjacentBasic::NUL;
    try {
        d = driver->ts.consulta(tipus);
        
        if(d->getTipus() != Descripcio::Tipus::TIPUS){
            // error! s'esperava un tipus
            driver->error( error_no_tipus(tipus) );
        }

        // Obtenir TSB del tipus
        DescripcioTipus *dt = (DescripcioTipus*) d;
        tsb = dt->getTSB();
    } catch(TaulaSimbols::NomNoExistent ex) {
        driver->error( error_no_definit(tipus) );
    }

    // Comprovar que el nom del parametre no és una funció
    try {
        Descripcio *dp = driver->ts.consulta(nomParametre);

        if(dp->getTipus() == Descripcio::Tipus::FUNCIO || dp->getTipus() == Descripcio::Tipus::PROCEDIMENT){
            driver->error( error_nom_parametre_nom_funcio(), true );
        }
    } catch(TaulaSimbols::NomNoExistent ex) {

    }

    // Inserir el procedure a la taula de símbols
    DescripcioProc *df = new DescripcioProc();
    driver->ts.posar(nomFuncio, df);

    this->nomProcedure = nomFuncio;

    // és el primer paràmetre, segur que no n'hi ha cap altre
    
    DescripcioArgument *arg = new DescripcioArgument(tipus, DescripcioArgument::Tipus::IN_OUT);
    if(constant.isEmpty() && tsb != TipusSubjacentBasic::ARRAY){
        arg->setTipusArgument(DescripcioArgument::VALOR);
    }else if(!constant.isEmpty()){
        arg->setTipusArgument(DescripcioArgument::IN);
    }

    driver->ts.posarParam(nomFuncio, nomParametre, arg);

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, nomProcedure + " (") );
    this->fills.push_back( std::to_string(constant.getNodeId()) );
    this->fills.push_back( std::to_string(tipus.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, nomParametre) );
    Simbol::toDotFile(driver);
}

/**
 * Afegeix un paràmetre al procedure indicada per ProcContCap
 * ProcContCap -> ProcContCap , Tipus ID
 **/
void SimbolProcContCap::make(Driver *driver, SimbolProcContCap cap, SimbolArgType constant, SimbolTipus tipus, std::string nomParametre){
    // és un procedure que està inserit a la taula de símbols (no importa comprovar
    // que realment existeix)
    // és possible que ja existeixi paràmetre amb aquest no (error quan s'insereixi)
    
    // Comprovar que el nom del parametre no és una funció
    try {
        Descripcio *dp = driver->ts.consulta(nomParametre);

        if(dp->getTipus() == Descripcio::Tipus::FUNCIO || dp->getTipus() == Descripcio::Tipus::PROCEDIMENT){
            driver->error( error_nom_parametre_nom_funcio(), true );
        }
    } catch(TaulaSimbols::NomNoExistent ex) {

    }

    // comprovar que tipus és un tipus
    Descripcio *d = nullptr;
    TipusSubjacentBasic tsb = TipusSubjacentBasic::NUL;
    try {
        d = driver->ts.consulta(tipus);
        if(d->getTipus() != Descripcio::Tipus::TIPUS){
            // error! s'esperava un tipus
            driver->error( error_no_tipus(tipus) );
        }

        // Obtenir TSB del tipus
        DescripcioTipus *dt = (DescripcioTipus*) d;
        tsb = dt->getTSB();
    } catch (TaulaSimbols::NomNoExistent ex) {
        // no existeix!
        driver->error( error_no_definit(tipus) );
    }

    // si el tipus és un array, serà passat per referència (mode in-out)
    DescripcioArgument *arg = new DescripcioArgument(tipus, DescripcioArgument::Tipus::IN_OUT);
    DescripcioTipus *dt = (DescripcioTipus *) d;
    if(constant.isEmpty() && tsb != TipusSubjacentBasic::ARRAY){
        arg->setTipusArgument(DescripcioArgument::VALOR);
    }else if(!constant.isEmpty()){
        arg->setTipusArgument(DescripcioArgument::IN);
    }

    try {
        driver->ts.posarParam(cap.getNomProcedure(), nomParametre, arg);
    } catch (TaulaSimbols::NomExistent ex) {
        driver->error(error_parametre_ja_definit(cap.getNomProcedure(), nomParametre));
    }

    // s'ha de passar el nom a les altres produccions
    this->nomProcedure = cap.getNomProcedure();

    // pintar a l'arbre
    this->fills.push_back( std::to_string(cap.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ",") );
    this->fills.push_back( std::to_string(constant.getNodeId()) );
    this->fills.push_back( std::to_string(tipus.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, nomParametre) );
    Simbol::toDotFile(driver);
}

std::string SimbolProcContCap::getNomProcedure(){
    return this->nomProcedure;
}