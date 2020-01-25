#include "SimbolArgType.h"
#include "../Driver.h"

SimbolArgType::SimbolArgType() : Simbol("ArgType") {}
SimbolArgType::~SimbolArgType(){}

/**
 * argType -> const
 * argType -> lambda
 */
void SimbolArgType::make(Driver *driver, bool constant){
    this->_empty = false;

    if(!constant){
        // és la derivació a lambda
        this->makeEmpty();
    }

    // pintar a l'arbre
    if(constant){
        this->fills.push_back( driver->addTreeChild(this, "const") );
    }
    
    Simbol::toDotFile(driver);
}