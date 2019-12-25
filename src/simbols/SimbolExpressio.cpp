#include "SimbolExpressio.h"
#include "../Driver.h"

SimbolExpressio::SimbolExpressio() : Simbol() {

}

SimbolExpressio::~SimbolExpressio(){

}

/**
 * exprSimple -> literal
 */
void SimbolExpressio::make(Driver *driver, SimbolLiteral literal){
    // copiar el tipus i tipus subjacent bàsic del literal
    this->tipus = literal.getTipus();
    this->tsb = literal.getTSB();
    
    // prové d'un literal, és una expressió constant
    this->mode = SimbolExpressio::Mode::CONST;
}


std::string SimbolExpressio::getTipus(){
    return this->tipus;
}

TipusSubjacentBasic SimbolExpressio::getTSB(){
    return this->tsb;
}

SimbolExpressio::Mode SimbolExpressio::getMode(){
    return this->mode;
}