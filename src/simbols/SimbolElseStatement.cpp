#include "SimbolElseStatement.h"
#include "../Driver.h"

SimbolElseStatement::SimbolElseStatement() : SimbolStatement() {
    this->nomNode = "ElseStatement";
}

SimbolElseStatement::~SimbolElseStatement(){}

/**
 * elseStatement -> else do bloc 
 */
void SimbolElseStatement::make(Driver *driver, SimbolBloc bloc){
    this->propaga(bloc);

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "else do") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * elseStatement -> lambda
 */
void SimbolElseStatement::make(Driver *driver){
    this->makeEmpty();

    // i pintar a l'arbre
    Simbol::toDotFile(driver);
}