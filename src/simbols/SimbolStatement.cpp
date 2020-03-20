#include "SimbolStatement.h"
#include "SimbolIfStatement.h"
#include "SimbolWhileStatement.h"
#include "SimbolSwitchStatement.h"
#include "../Driver.h"
#include <iostream>


SimbolStatement::SimbolStatement() : Simbol("Statement"), ControlInstruccions() {}
SimbolStatement::~SimbolStatement() {}

/**
 * statement -> whileStatement
 */
void SimbolStatement::make(Driver *driver, SimbolWhileStatement whileStmt){
    this->propaga(whileStmt);

    // pintar a l'arbre
    this->fills.push_back( std::to_string(whileStmt.getNodeId()) );
    Simbol::toDotFile(driver);

	this->seg = whileStmt.getSeg();
}

/**
 * statement -> forStatement
 */
void SimbolStatement::make(Driver *driver, SimbolForStatement forStmt){
    this->propaga(forStmt);

    // pintar a l'arbre
    this->fills.push_back( std::to_string(forStmt.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * statement -> ifStatement
 */
void SimbolStatement::make(Driver *driver, SimbolIfStatement ifStmt){
    this->propaga(ifStmt);

    // pintar a l'arbre
    this->fills.push_back( std::to_string(ifStmt.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * statement -> return exprSimple
 */
void SimbolStatement::make(Driver *driver, SimbolExpressio exp){
    if(exp.isNull()){
        return;
    }
    
    // s'ha d'inserir el return dins la llista de returns
    struct ControlInstruccions::ReturnData tmp;
    tmp.tipus = exp.getTipus();
    tmp.tsb = exp.getTSB();
    tmp.loc = driver->getLocation();

    this->_returns.push_back(tmp);

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "return") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * statement -> break
 */
void SimbolStatement::make(Driver *driver, SimbolStatement::Tipus tipus){
    if(tipus == SimbolStatement::Tipus::BREAK){
        this->_conteBreak = true;
    }

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "break") );
    Simbol::toDotFile(driver);
}

/**
 * statement -> expression
 */
void SimbolStatement::make(Driver *driver, SimbolAssignacio exp){
    // pintar a l'arbre
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * statement -> subProgramCall
 */
void SimbolStatement::make(Driver *driver, SimbolSubProgramCall call){
    // pintar a l'arbre
    this->fills.push_back( std::to_string(call.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * statement -> switchStatement
 */
void SimbolStatement::make(Driver *driver, SimbolSwitchStatement switchStmt){
    this->propaga(switchStmt);
    // pintar a l'arbre
    this->fills.push_back( std::to_string(switchStmt.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * statement -> varDecl
 */
void SimbolStatement::make(Driver *driver, SimbolVarDecl decl){
    // pintar a l'arbre
    this->fills.push_back( std::to_string(decl.getNodeId()) );
    Simbol::toDotFile(driver);
}

std::vector<Instruction * > SimbolStatement::getSeg() {
    return this->seg;
}