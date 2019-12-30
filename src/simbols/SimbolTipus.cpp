#include "SimbolTipus.h"
#include "../Driver.h"

SimbolTipus::SimbolTipus() : Simbol("Tipus") {}
SimbolTipus::~SimbolTipus() {}

/**
 * tipus -> id
 */
void SimbolTipus::make(Driver *driver, std::string tipus){
    this->tipus = tipus;

    // representar l'arbre
    this->fills.push_back( driver->addTreeChild(this, tipus) );
    Simbol::toDotFile(driver);
}

/**
 * tipus -> array
 */
void SimbolTipus::make(Driver *driver, SimbolTipusArray array){
    if(array.isReferencia() || array.isNull()){
        return;
    }

    this->tipus = array.toString();

    // representar l'arbre
    this->fills.push_back( std::to_string(array.getNodeId()) );
    Simbol::toDotFile(driver);
}

std::string SimbolTipus::getTipus(){
    return this->tipus;
}

SimbolTipus::operator std::string() const{
    return this->tipus;
}