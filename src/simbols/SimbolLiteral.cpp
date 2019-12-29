#include "SimbolLiteral.h"
#include "../Driver.h"

SimbolLiteral::SimbolLiteral() : Simbol("Literal") {}

SimbolLiteral::~SimbolLiteral() {}

/**
 * literal -> INT_LITERAL
 */
void SimbolLiteral::make(Driver *driver, int valor){
    this->tsb = TipusSubjacentBasic::INT;
    this->tipus.clear();
    this->intValue = valor;

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, std::to_string(valor)) );
    Simbol::toDotFile(driver);
}

/**
 * literal -> CHAR_LITERAL
 */
void SimbolLiteral::make(Driver *driver, char valor){
    this->tsb = TipusSubjacentBasic::CHAR;
    this->tipus.clear();

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "'"+std::to_string(valor)+"'") );
    Simbol::toDotFile(driver);
}

/**
 * literal -> STR_LITERAL
 */
void SimbolLiteral::make(Driver *driver, std::string valor){
    this->tsb = TipusSubjacentBasic::CHAR;
    this->tipus = "string";

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "\\\""+valor+"\\\"") );
    Simbol::toDotFile(driver);
}

std::string SimbolLiteral::getTipus(){
    return this->tipus;
}

void SimbolLiteral::setTipus(std::string newtipus) {
    this->tipus = newtipus;
}

TipusSubjacentBasic SimbolLiteral::getTSB(){
    return this->tsb;
}

void SimbolLiteral::setTSB(TipusSubjacentBasic newtsb) {
    this->tsb = newtsb;
}

int SimbolLiteral::getIntValue(){
    return this->intValue;
}

char SimbolLiteral::getCharValue(){
    return this->charValue;
}