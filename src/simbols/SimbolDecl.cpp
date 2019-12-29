#include "SimbolDecl.h"
#include "../Driver.h"


void SimbolDecl::make(Driver *driver, Simbol simbol){
    // afegir fill
    this->fills.push_back(std::to_string(simbol.getNodeId()));
    Simbol::toDotFile(driver);
}