#include "SimbolStatementList.h"
#include "../Driver.h"

SimbolStatementList::SimbolStatementList() : ControlInstruccions() {}
SimbolStatementList::~SimbolStatementList() {}

#include <iostream>

/**
 * statementList -> statement ; statementList
 */
void SimbolStatementList::make(Driver *driver, SimbolStatement stmt, SimbolStatementList list) {
    this->propaga(stmt, list);

    std::cout << "Conté break = " << this->_conteBreak << std::endl;
    std::cout << "Conté break (list) = " << list._conteBreak << std::endl;
    std::cout << "Conté break (stmt) = " << stmt.conteBreak() << std::endl;
}