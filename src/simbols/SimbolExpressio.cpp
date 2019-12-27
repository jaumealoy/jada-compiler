#include "SimbolExpressio.h"
#include "../Driver.h"

/**
 * L'operació de dues expressions constants dona lloc a una expressió constant
 * Si alguna d'elles és una expressió variable o resultat, serà una 
 * expressió variable o resultat.
 */

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
    
    if(this->tsb == TipusSubjacentBasic::INT){
        this->intValue = literal.getIntValue();
    }else if(this->tsb == TipusSubjacentBasic::CHAR){
        this->charValue = literal.getCharValue();
    }

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

    // Copiar informació del mode i tipus
    this->mode = exp.getMode();
    this->tipus = exp.getTipus();
    this->tsb = exp.getTSB();

    switch (tipus) {
        case 0: // exprSimple -> not exprSimple
            // comprovar que exprSimple és un boolean
            if(exp.getTSB() != TipusSubjacentBasic::BOOLEAN){
                driver->error("s'esperava un boolean");
                this->makeNull();
            }

            if(exp.getMode() == SimbolExpressio::Mode::CONST){
                // processar el valor
                this->boolValue = !exp.boolValue;
            }

            break;
        
        case 1: // exprSimple -> ( exprSimple )
            // el valor pot ser un enter o boolean

            // copiarem el seus valors independentment de si són constants o no
            // només s'utilitzaran si són constants
            if(exp.getTSB() == TipusSubjacentBasic::INT){
                this->intValue = exp.intValue;
            }else if(exp.getTSB() == TipusSubjacentBasic::BOOLEAN){
                this->boolValue = exp.boolValue;
            }else{
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
        case 0: // AND
        case 1: // OR
            // els tipus subjacents bàsics d'a i b han de ser boolean
            if(a.getTSB() != TipusSubjacentBasic::BOOLEAN || b.getTSB() != TipusSubjacentBasic::BOOLEAN){
                driver->error("s'esperava un boolean");
                this->makeNull();
                return;
            }

            if(a.getMode() == b.getMode() && a.getMode() == SimbolExpressio::Mode::CONST){
                this->mode = SimbolExpressio::Mode::CONST;

                // a i b són constants, podem calcular el valor resultat
                // i el resultat serà una constant
                if(tipus == 0){
                    this->boolValue = a.boolValue && b.boolValue;
                }else if(tipus == 1){
                    this->boolValue = a.boolValue || b.boolValue;
                }
            }else{
                this->mode = SimbolExpressio::Mode::RESULTAT;
            }

            this->tipus.clear();
            this->tsb = TipusSubjacentBasic::BOOLEAN;

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
        case SimbolReferencia::ModeMVP::CONST: {
            this->mode = SimbolExpressio::Mode::CONST;

            // consultar el seu valor a la taula de símbols
            DescripcioConstant *dc = (DescripcioConstant *) driver->ts.consulta(ref.getId());
            
            switch (ref.getTSB()){
                case INT:
                    this->intValue = dc->getIntValue();
                    break;

                case BOOLEAN:
                    this->boolValue = dc->getBoolValue();
                    break;
            }

            break;
        }

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

int SimbolExpressio::getIntValue(){
    return this->intValue;
}

bool SimbolExpressio::getBoolValue(){
    return this->boolValue;
}

char SimbolExpressio::getCharValue(){
    return this->charValue;
}