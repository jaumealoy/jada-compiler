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


/**
 * exprSimple -> not exprSimple
 * exprSimple -> ( exprSimple )
 */
void SimbolExpressio::make(Driver *driver, SimbolExpressio exp, int tipus){
    if(exp.isNull()){
        this->makeNull();
        return;
    }

    switch (tipus) {
        case 0: // exprSimple -> not exprSimple
            // comprovar que exprSimple és un boolean
            if(exp.getTSB() != TipusSubjacentBasic::BOOLEAN){
                driver->error("s'esperava un boolean");
                this->makeNull();
            }

            break;
        
        case 1: // exprSimple -> ( exprSimple )
            // el valor pot ser un enter o boolean
            if(exp.getTSB() != TipusSubjacentBasic::INT && exp.getTSB() != TipusSubjacentBasic::BOOLEAN){
                driver->error("s'esperava int o boolean");
                this->makeNull();
            }

            break;

        default:
            this->makeNull();
    }
}

/**
 * exprSimple -> exprSimple AND exprSimple
 * exprSimple -> exprSimple OR exprSimple
 */
void SimbolExpressio::make(Driver *driver, SimbolExpressio a, SimbolExpressio b, int tipus){
    if(a.isNull() || b.isNull()){
        this->makeNull();
        return;
    }

    switch (tipus) {
        case 0:
        case 1:
            // els tipus subjacents bàsics d'a i b han de ser boolean
            if(a.getTSB() != TipusSubjacentBasic::BOOLEAN || b.getTSB() != TipusSubjacentBasic::BOOLEAN){
                driver->error("s'esperava un boolean");
                this->makeNull();
                return;
            }

            break;
        
        default: 
            this->makeNull();
    }
}


/**
 * exprSimple -> referencia
 */
void SimbolExpressio::make(Driver *driver, SimbolReferencia ref){
    if(ref.isNull()){
        // és una referència invàlida, s'ha d'ignorar
        this->makeNull();
        return;
    }

    this->tsb = ref.getTSB();
    this->tipus = ref.getTipus();

    switch (ref.getMode()) {
        case SimbolReferencia::ModeMVP::CONST:
            this->mode = SimbolExpressio::Mode::CONST;
            break;

        case SimbolReferencia::ModeMVP::VAR:
            this->mode = SimbolExpressio::Mode::VAR;
            break;

        case SimbolReferencia::ModeMVP::CRIDA_COMPLETA:
            this->mode = SimbolExpressio::Mode::RESULTAT;
            break;

        default: 
            // no hauria d'arribar aquí perquè si és una referència 
            this->makeNull();
            return;
    }
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

bool SimbolExpressio::isNull() {
    return this->tsb == TipusSubjacentBasic::NUL && this->tipus.empty();
}

void SimbolExpressio::makeNull() {
    this->tsb = NUL;
    this->tipus.clear();
}