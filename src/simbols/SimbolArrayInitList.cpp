#include "SimbolArrayInitList.h"
#include "../Driver.h"
#include <iostream>

SimbolArrayInitList::SimbolArrayInitList() : SimbolArrayElementList() {}
SimbolArrayInitList::~SimbolArrayInitList() {}

/**
 * arrayInitList -> { arrayElementList }
 */
void SimbolArrayInitList::make(Driver *driver, SimbolArrayElementList elementList){
    this->elements = elementList.getElements();
    this->dimensions = elementList.getDimensions();

    this->elementsFinals = false;

    this->match = elementList.coincideixen();
    this->numElementsActuals = 1;

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "{") );
    this->fills.push_back( std::to_string(elementList.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "}") );
    Simbol::toDotFile(driver);
}

/**
 * arrayInitList -> arrayInitList , { arrayElementList }
 */
void SimbolArrayInitList::make(Driver *driver, SimbolArrayInitList list, SimbolArrayElementList elementList){
    this->elementsFinals = false;

    this->match = list.match && elementList.coincideixen();
    if(this->match && !list.isEmpty()){
        // totes les subdimensions de arrayInitList coincideixen
        // s'ha de comprovar si passa el mateix amb elementList
        this->match = list.dimensions.size() == elementList.getDimensions().size();
        
        for(int i = list.dimensions.size() - 1; this->match && i >= 0; i--){
            this->match = list.dimensions[i] == elementList.getDimensions()[i];
        }
    }

    // tant si coincideixen com no, l'error es mostrarà quan es tengui tota 
    // l'estructura de l'array definida
    this->dimensions = list.dimensions;
    this->elements = list.elements;

    this->numElementsActuals = list.getElementsActuals() + 1;

    // afegir tots els elements que han trobat elementList
    for(int i = 0; i < elementList.getElements().size(); i++){
        this->elements.push_back(elementList.getElements()[i]);
    }

    // pintar a l'arbre
    this->fills.push_back( std::to_string(list.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ", {") );
    this->fills.push_back( std::to_string(elementList.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "}") );
    Simbol::toDotFile(driver);
}