#include "SimbolFuncContCap.h"
#include "../Driver.h"
#include "../code/instructions/SkipInstruction.h"

SimbolFuncContCap::SimbolFuncContCap() : Simbol("FuncContCap") {}
SimbolFuncContCap::~SimbolFuncContCap() {}

/**
 * Crea una funció (sense tipus de retorn) i afegeix un paràmetre
 * funcContCap -> ID ( Tipus ID
 */
void SimbolFuncContCap::make(Driver *driver, std::string nomFuncio, SimbolArgType constant, SimbolTipus tipus, std::string nomParametre){
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
        this->nomFuncio = nomFuncio;
        return;
    }

    // comprovar que tipus és efectivament un tipus vàlid
    Descripcio *d = nullptr;
    TipusSubjacentBasic tsb = TipusSubjacentBasic::NUL;
    try {
        d = driver->ts.consulta(tipus);
        
        if(d->getTipus() != Descripcio::Tipus::TIPUS){
            // error! s'esperava un tipus
            driver->error(error_no_tipus(tipus), true);
        }

        // Obtenir TSB del tipus
        DescripcioTipus *dt = (DescripcioTipus*) d;
        tsb = dt->getTSB();
    } catch(TaulaSimbols::NomNoExistent ex) {
        driver->error(error_no_definit(tipus), true);
        return;
    }

    // Comprovar que el nom del parametre no és una funció
    try {
        Descripcio *dp = driver->ts.consulta(nomParametre);

        if(dp->getTipus() == Descripcio::Tipus::FUNCIO || dp->getTipus() == Descripcio::Tipus::PROCEDIMENT){
            driver->error( error_nom_parametre_nom_funcio(), true );
        }
    } catch(TaulaSimbols::NomNoExistent ex) {

    }

	// crear el procedure a la generació de codi
	Label start = driver->code.addLabel();
	SubProgram *subprogram = driver->code.addSubProgram(nomFuncio, start);

	// indicar l'etiqueta d'inici del subprograma
	driver->code.addInstruction(new SkipInstruction(start));

    // Inserir la funció a la taula de símbols
    DescripcioFuncio *df = new DescripcioFuncio(subprogram);
    driver->ts.posar(nomFuncio, df);

    this->nomFuncio = nomFuncio;

    // és el primer paràmetre, segur que no n'hi ha cap altre
    // tots els paràmetres es passen com a mode IN_OUT, excepte que estiguin
    // marcats com constants
    DescripcioArgument *arg = new DescripcioArgument(tipus, DescripcioArgument::Tipus::IN_OUT);
    if(constant.isEmpty() && tsb != TipusSubjacentBasic::ARRAY){
        arg->setTipusArgument(DescripcioArgument::VALOR);
    }else if(!constant.isEmpty()){
        arg->setTipusArgument(DescripcioArgument::IN);
    }

    driver->ts.posarParam(nomFuncio, nomParametre, arg);    

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, nomFuncio + " ( ") );
    this->fills.push_back( std::to_string(constant.getNodeId()) );
    this->fills.push_back( std::to_string(tipus.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, nomParametre) );
    Simbol::toDotFile(driver);
}

/**
 * Afegeix un paràmetre a la funció indicada per funcContCap
 * funcContCap -> funcContCap , Tipus ID
 **/
void SimbolFuncContCap::make(Driver *driver, SimbolFuncContCap cap, SimbolArgType constant, SimbolTipus tipus, std::string nomParametre){
    // és una funció que està inserida a la taula de símbols (no importa comprovar
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
            driver->error(error_no_tipus(tipus), true);
        }

        // Obtenir TSB del tipus
        DescripcioTipus *dt = (DescripcioTipus*) d;
        tsb = dt->getTSB();
    } catch (TaulaSimbols::NomNoExistent ex) {
        // no existeix!
        driver->error(error_no_definit(tipus), true);
        return;
    }

    // tots els paràmetres es passen com a mode IN_OUT, excepte que estiguin marcats
    // com a constants
    DescripcioArgument *arg = new DescripcioArgument(tipus, DescripcioArgument::Tipus::IN_OUT);
    if(constant.isEmpty() && tsb != TipusSubjacentBasic::ARRAY){
        arg->setTipusArgument(DescripcioArgument::VALOR);
    }else if(!constant.isEmpty()){
        arg->setTipusArgument(DescripcioArgument::IN);
    }

    try {
        driver->ts.posarParam(cap.getNomFuncio(), nomParametre, arg);
    } catch (TaulaSimbols::NomExistent ex) {
        driver->error( error_parametre_ja_definit(cap.getNomFuncio(), nomParametre) );
    }

    // s'ha de passar el nom a les altres produccions
    this->nomFuncio = cap.getNomFuncio();

    // pintar a l'arbre
    this->fills.push_back( std::to_string(cap.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ", ") );
    this->fills.push_back( std::to_string(constant.getNodeId()) );
    this->fills.push_back( std::to_string(tipus.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, nomParametre) );
    Simbol::toDotFile(driver);
}

std::string SimbolFuncContCap::getNomFuncio(){
    return this->nomFuncio;
}