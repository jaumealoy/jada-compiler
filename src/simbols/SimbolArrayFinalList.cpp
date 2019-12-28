#include "SimbolArrayFinalList.h"
#include "../Driver.h"

SimbolArrayFinalList::SimbolArrayFinalList() : SimbolArrayElementList(){}
SimbolArrayFinalList::~SimbolArrayFinalList(){}

/**
 * La comprovació de tipus de tots els elements es farà quan es conegui el tipus
 * de la variable. 
 * En aquest punt no es pot conèixer quin és el tipus unitari de l'array al que 
 * s'està fent la inicialització
 * 
 * El conjunt d'aquestes llistes són els elements finals
 */

/**
 * arrayFinalList -> exprSimple
 */
void SimbolArrayFinalList::make(Driver *driver, SimbolExpressio exp){
    this->elements.clear();

    this->numElementsActuals = 1;
    this->elements.push_back(exp);

    this->match = true;
}

/**
 * arrayFinalList -> arrayFinalList , exprSimple
 */
void SimbolArrayFinalList::make(Driver *driver, SimbolArrayFinalList list, SimbolExpressio exp){
    this->elements = list.elements;
    this->elements.push_back(exp);
    this->numElementsActuals = list.numElementsActuals + 1;
    this->match = list.match;
}
