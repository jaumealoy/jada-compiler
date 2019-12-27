#include "SimbolArithmeticExpression.h"
#include "../Driver.h"

SimbolArithmeticExpression::SimbolArithmeticExpression() : SimbolExpressio() {

}

SimbolArithmeticExpression::~SimbolArithmeticExpression(){

}

/**
 * aritExpr -> - exprSimple
 */
void SimbolArithmeticExpression::make(Driver *driver, SimbolExpressio exp){
    if(exp.isNull()){
        this->makeNull();
        return;
    }

    if(exp.getTSB() != TipusSubjacentBasic::INT){
        this->makeNull();
        driver->error("s'esperava enter");
        return;
    }

    if(exp.getMode() == SimbolExpressio::Mode::CONST){
        this->intValue = -exp.getIntValue();
    }

    this->mode = exp.getMode();
    this->tsb = TipusSubjacentBasic::INT;
    this->tipus.empty();
}

/**
 * aritExpr -> exprSimple + exprSimple
 * aritExpr -> exprSimple - exprSimple
 * aritExpr -> exprSimple * exprSimple
 * aritExpr -> exprSimple / exprSimple
 */
void SimbolArithmeticExpression::make(Driver *driver, SimbolExpressio a, SimbolExpressio b, int tipus){
    if(a.isNull() || b.isNull()){
        this->makeNull();
        return;
    }

    // només es poden fer operacions aritmètiques entre enters
    if(a.getTSB() != TipusSubjacentBasic::INT || b.getTSB() != TipusSubjacentBasic::INT){
        this->makeNull();
        driver->error("operacion tipus incompatibles");
        return;
    }

    // calcular el resultat si és constant
    if(a.getMode() == b.getMode() && a.getMode() == SimbolExpressio::Mode::CONST){
        switch (tipus) {
            case 0: // exprSimple + exprSimple
                this->intValue = a.getIntValue() + b.getIntValue();
                break;
            
            case 1: // exprSimple - exprSimpe
                this->intValue = a.getIntValue() - b.getIntValue();
                break;

            case 2: // exprSimple * exprSimpe
                this->intValue = a.getIntValue() * b.getIntValue();
                break;

            case 3: // exprSimple / exprSimpe
                if(b.getIntValue() == 0){
                    driver->error("division by zero");
                    this->makeNull();
                    return;
                }

                this->intValue = a.getIntValue() - b.getIntValue();
                break;
        }

        this->mode = SimbolExpressio::Mode::CONST;
    }else{
        this->mode = SimbolExpressio::Mode::RESULTAT;
    }

    this->tsb = TipusSubjacentBasic::INT;
    this->tipus.empty();
}