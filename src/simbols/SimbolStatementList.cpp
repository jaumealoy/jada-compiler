#include "SimbolStatementList.h"
#include "../Driver.h"

SimbolStatementList::SimbolStatementList() : ControlInstruccions() {}
SimbolStatementList::~SimbolStatementList() {}

/**
 * statementList -> statement ; statementList
 */
void SimbolStatementList::make(Driver *driver, SimbolStatement stmt, SimbolStatementList list) {
    this->propaga(stmt, list);    
}