#include "SimbolDeclList.h"

SimbolDeclList::SimbolDeclList() : Simbol("Llista declaracions") {}
SimbolDeclList::~SimbolDeclList() {}

void SimbolDeclList::make(Driver *driver, SimbolDecl decl){
    // afegir els fills
    this->fills.push_back(std::to_string(decl.getNodeId()));
    Simbol::toDotFile(driver);
}

void SimbolDeclList::make(Driver *driver, SimbolDecl decl, SimbolDeclList list){

    // afegir els fills
    this->fills.push_back(std::to_string(decl.getNodeId()));
    this->fills.push_back(std::to_string(list.getNodeId()));
    Simbol::toDotFile(driver);
}