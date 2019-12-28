#include "SimbolStatementList.h"
#include "../Driver.h"

SimbolStatementList::SimbolStatementList() : Simbol("StatementList"), ControlInstruccions() {}
SimbolStatementList::~SimbolStatementList() {}

#include <iostream>

/**
 * statementList -> statement ; statementList
 */
void SimbolStatementList::make(Driver *driver, SimbolStatement stmt, SimbolStatementList list) {
    this->propaga(stmt, list);

    // pintar a l'arbre
    this->fills.push_back( std::to_string(stmt.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ";") );
    this->fills.push_back( std::to_string(list.getNodeId()) );
    Simbol::toDotFile(driver);
}


/**
 * statementList -> lambda
 */
void SimbolStatementList::make(Driver *driver){
    this->makeEmpty();

    // pintar a l'arbre
    Simbol::toDotFile(driver);
}