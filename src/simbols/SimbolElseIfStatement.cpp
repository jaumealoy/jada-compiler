#include "SimbolElseIfStatement.h"
#include "../Driver.h"

SimbolElseIfStatement::SimbolElseIfStatement() : SimbolStatement() {
    this->nomNode = "ElseIfStatement";
}

SimbolElseIfStatement::~SimbolElseIfStatement(){}

/**
 * elseIfStatement -> else if exprSimple do bloc end elseIfStatement
 */
/*void SimbolElseIfStatement::make(Driver *driver, SimbolExpressio exp, SimbolMarcador marc, SimbolBloc bloc, SimbolElseIfStatement elseIf){
    // comprovar que l'expressió és un boolean
    if(exp.getTSB() != TipusSubjacentBasic::BOOLEAN){
        driver->error( error_tipus_esperat(TipusSubjacentBasic::BOOLEAN) );
    }

    // propagar els possibles returns i breaks que benguin de bloc i elseIfStatement
    this->propaga(bloc, elseIf);

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "else if") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "do") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end") );
    this->fills.push_back( std::to_string(elseIf.getNodeId()) );
    Simbol::toDotFile(driver);
}*/

//ElseIfStatement -> IF exprSimple DO M0 bloc 

void SimbolElseIfStatement::make(Driver *driver, SimbolExpressio exp, SimbolMarcador marc, SimbolBloc bloc){
    // comprovar que l'expressió és un boolean
    if(exp.getTSB() != TipusSubjacentBasic::BOOLEAN){
        driver->error( error_tipus_esperat(TipusSubjacentBasic::BOOLEAN) );
    }

    // propagar els possibles returns i breaks que venguin de bloc i elseIfStatement
    this->propaga(bloc);

    //generació de codi
    driver->code.backpatch(marc.getLabel(), exp.getCert());
    printf("%d", marc.getLabel().getId());

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "if") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "do") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end") );
    //this->fills.push_back( std::to_string(elseIf.getNodeId()) );
    Simbol::toDotFile(driver);
}

//elseIfStatement -> elseIfStatement ELSE IF exprSimple DO M0 bloc
void SimbolElseIfStatement::make(Driver *driver, SimbolElseIfStatement elseif, SimbolExpressio exp, SimbolMarcador marc, SimbolBloc bloc){
    // comprovar que l'expressió és un boolean
    if (exp.getTSB() != TipusSubjacentBasic::BOOLEAN){
        driver->error( error_tipus_esperat(TipusSubjacentBasic::BOOLEAN) );
    }

    this->propaga(bloc, elseif);

    //Generació de codi
    driver->code.backpatch(marc.getLabel(), exp.getCert());
    elseif.seg = exp.getFals();
    
    // pintar a l'arbre
    this->fills.push_back( std::to_string(elseif.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "else if") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "do") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * elseIfStatement -> elseStatement
 */
/*
void SimbolElseIfStatement::make(Driver *driver, SimbolElseStatement elseBloc){
    if(!elseBloc.isEmpty()){
        // no és una derivació a lambda
        // s'hauran de propagar els possibles valors de retorn i break
        this->propaga(elseBloc);
    }

    // pintar a l'arbre
    this->fills.push_back( std::to_string(elseBloc.getNodeId()) );
    Simbol::toDotFile(driver);
}
*/

