#include "SimbolStatement.h"
#include "SimbolIfStatement.h"
#include "SimbolWhileStatement.h"
#include <iostream>

SimbolStatement::SimbolStatement() : Simbol(), ControlInstruccions() {

}

SimbolStatement::~SimbolStatement() {

}

/**
 * statement -> whileStatement
 */
void SimbolStatement::make(Driver *driver, SimbolWhileStatement whileStmt){
    this->propaga(whileStmt);
}

/**
 * statement -> ifStatement
 */
void SimbolStatement::make(Driver *driver, SimbolIfStatement ifStmt){
    this->propaga(ifStmt);
}

/**
 * statement -> return exprSimple
 */
void SimbolStatement::make(Driver *driver, SimbolExpressio exp){
    // s'ha d'inserir el return dins la llista de returns
    struct ControlInstruccions::ReturnData tmp;
    tmp.tipus = exp.getTipus();
    tmp.tsb = exp.getTSB();

    this->_returns.push_back(tmp);
}

/**
 * statement -> break
 */
void SimbolStatement::make(Driver *driver, SimbolStatement::Tipus tipus){
    if(tipus == SimbolStatement::Tipus::BREAK){
        this->_conteBreak = true;
    }
}