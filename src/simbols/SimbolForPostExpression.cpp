#include "SimbolForPostExpression.h"
#include "../Driver.h"

SimbolForPostExpression::SimbolForPostExpression() : Simbol("ForPostExpression") {}
SimbolForPostExpression::~SimbolForPostExpression() {}

/**
 * forPostExpression -> lambda
 */
void SimbolForPostExpression::make(Driver *driver){
    this->makeEmpty();
    Simbol::toDotFile(driver);
}

/**
 * forPostExpression -> expression
 */
void SimbolForPostExpression::make(Driver *driver, SimbolAssignacio assig){
    // i pintar a l'arbre
    this->fills.push_back( std::to_string(assig.getNodeId()) );
    Simbol::toDotFile(driver);
}