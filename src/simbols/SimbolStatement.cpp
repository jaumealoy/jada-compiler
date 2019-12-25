#include "SimbolStatement.h"
#include "SimbolIfStatement.h"
#include <iostream>

SimbolStatement::SimbolStatement() : Simbol(), ControlInstruccions() {

}

SimbolStatement::~SimbolStatement() {

}

/**
 * statement -> ifStatement
 */
void SimbolStatement::make(Driver *driver, SimbolIfStatement ifStmt){
    this->propaga(ifStmt);
}


void SimbolStatement::make(Driver *driver, SimbolStatement::Tipus tipus){
    if(tipus == SimbolStatement::Tipus::BREAK){
        this->_conteBreak = true;
    }
}