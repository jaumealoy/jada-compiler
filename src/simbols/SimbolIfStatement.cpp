#include "SimbolIfStatement.h"
#include "../Driver.h"

SimbolIfStatement::SimbolIfStatement() : SimbolStatement() {
    this->nomNode = "IfStatement";
}

SimbolIfStatement::~SimbolIfStatement() { }

/**
 * ifStatement -> if exprSimple do bloc elseIfStatement end
 */
/*
void SimbolIfStatement::make(Driver *driver, SimbolExpressio exp, SimbolMarcador marc, SimbolBloc bloc, SimbolElseIfStatement elseIfStmt) {
    // Qualsevol part de l'if no atura la propagació dels returns o breaks
    this->propaga(bloc, elseIfStmt);

    // Comprovar que l'expressió correspon un boolean
    if(exp.getTSB() != TipusSubjacentBasic::BOOLEAN) {
        // error
        driver->error( error_tipus_esperat(TipusSubjacentBasic::BOOLEAN) );
        return;
    }

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "if") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "do") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    this->fills.push_back( std::to_string(elseIfStmt.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end") );
    Simbol::toDotFile(driver);
}*/
//ifStatement : elseStatement BEND
void SimbolIfStatement::make(Driver *driver, SimbolElseStatement elseS){
    this->propaga(elseS);

    this->fills.push_back( std::to_string(elseS.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end") );
    Simbol::toDotFile(driver);
}