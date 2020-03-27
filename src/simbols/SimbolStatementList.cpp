#include "SimbolStatementList.h"
#include "../Driver.h"

SimbolStatementList::SimbolStatementList() : Simbol("StatementList"), ControlInstruccions() {}
SimbolStatementList::~SimbolStatementList() {}

#include <iostream>

/**
 * statementList -> statement ; M0 statementList
 */
void SimbolStatementList::make(Driver *driver, SimbolStatement stmt, SimbolMarcador m, SimbolStatementList list) {
    this->propaga(stmt, list);

    // pintar a l'arbre
    this->fills.push_back( std::to_string(stmt.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ";") );
    this->fills.push_back( std::to_string(list.getNodeId()) );
    Simbol::toDotFile(driver);

    // generacio de codi intermedi
    driver->code.backpatch(m.getLabel(), stmt.getSeg());
    this->seg = stmt.getSeg();
}


/**
 * statementList -> lambda
 */
void SimbolStatementList::make(Driver *driver){
    this->makeEmpty();

    // pintar a l'arbre
    Simbol::toDotFile(driver);
}