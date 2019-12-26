#include "SimbolLiteral.h"
#include "../Driver.h"

SimbolLiteral::SimbolLiteral() : Simbol() {

}

SimbolLiteral::~SimbolLiteral() {}

/**
 * literal -> INT_LITERAL
 */
void SimbolLiteral::make(Driver *driver, int valor){
    this->tsb = TipusSubjacentBasic::INT;
    this->tipus.clear();
    this->intValue = valor;
}

/**
 * literal -> CHAR_LITERAL
 */
void SimbolLiteral::make(Driver *driver, char valor){
    this->tsb = TipusSubjacentBasic::CHAR;
    this->tipus.clear();
}

/**
 * literal -> STR_LITERAL
 */
void SimbolLiteral::make(Driver *driver, std::string valor){
    this->tsb = TipusSubjacentBasic::CHAR;
    this->tipus = "string";
}

std::string SimbolLiteral::getTipus(){
    return this->tipus;
}

TipusSubjacentBasic SimbolLiteral::getTSB(){
    return this->tsb;
}

int SimbolLiteral::getIntValue(){
    return this->intValue;
}