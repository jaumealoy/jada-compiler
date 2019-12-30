#include "SimbolForInit.h"
#include "../Driver.h"

SimbolForInit::SimbolForInit() : Simbol("ForInit") {}
SimbolForInit::~SimbolForInit() {}

/**
 * forInit -> lambda
 */
void SimbolForInit::make(Driver *driver){
    this->makeEmpty();
    Simbol::toDotFile(driver);
}

/**
 * forInit -> varDecl
 */
void SimbolForInit::make(Driver *driver, SimbolVarDecl var){
    // i pintar a l'arbre
    this->fills.push_back( std::to_string(var.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * forInit -> expression
 */
void SimbolForInit::make(Driver *driver, SimbolAssignacio assig){
    // i pintar a l'arbre
    this->fills.push_back( std::to_string(assig.getNodeId()) );
    Simbol::toDotFile(driver);
}
