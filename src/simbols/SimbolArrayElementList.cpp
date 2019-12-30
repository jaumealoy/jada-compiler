#include "SimbolArrayElementList.h"
#include "SimbolArrayFinalList.h"
#include "SimbolArrayInitList.h"
#include "../Driver.h"

SimbolArrayElementList::SimbolArrayElementList() : Simbol("ArrayElementList") {}
SimbolArrayElementList::~SimbolArrayElementList() {}

/**
 * arrayElementList -> lambda
 */
void SimbolArrayElementList::make(Driver *driver){
    this->makeEmpty();
    this->numElementsActuals = 0;
    this->dimensions.push_back(0);
    this->elements.clear();
    this->match = true;

    Simbol::toDotFile(driver);
}

/**
 * arrayElementList -> arrayFinalList
 */
void SimbolArrayElementList::make(Driver *driver, SimbolArrayFinalList list){
    this->elementsFinals = true;
    
    // és una llista d'elements finals
    this->elements = list.getElements();
    this->dimensions = list.getDimensions();
    this->match = list.match;

    // La dimensió actual és una llista d'elements finals
    this->dimensions.push_back(list.numElementsActuals);

    // pintar a l'arbre
    this->fills.push_back( std::to_string(list.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * arrayElementList -> arrayInitList
 */
void SimbolArrayElementList::make(Driver *driver, SimbolArrayInitList list){
    this->elementsFinals = false;

    this->elements = list.getElements();
    this->dimensions = list.getDimensions();
    this->match = list.match;
    
    // La dimensió actual és una llista de dimensions. La dimensió a
    // afegir és quantes dimensions té la llista
    this->dimensions.push_back(list.getElementsActuals());

    // pintar a l'arbre
    this->fills.push_back( std::to_string(list.getNodeId()) );
    Simbol::toDotFile(driver);
}


bool SimbolArrayElementList::isElementsFinals(){
    return this->elementsFinals;
}

bool SimbolArrayElementList::coincideixen(){
    return this->match;
}

std::vector<SimbolExpressio> SimbolArrayElementList::getElements(){
    return this->elements;
}

std::vector<int> SimbolArrayElementList::getDimensions(){
    return this->dimensions;
}

int SimbolArrayElementList::getElementsActuals(){
    return this->numElementsActuals;
}