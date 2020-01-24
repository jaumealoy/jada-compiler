#include "SimbolArithmeticExpression.h"
#include "../Driver.h"

SimbolArithmeticExpression::SimbolArithmeticExpression() : SimbolExpressio() {
    this->nomNode = "ArithmeticExpression";
}

SimbolArithmeticExpression::~SimbolArithmeticExpression(){}

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
        driver->error( error_tipus_esperat("enter") );
        return;
    }

    if(exp.getMode() == SimbolExpressio::Mode::CONST){
        this->intValue = -exp.getIntValue();
    }

    this->mode = exp.getMode();
    this->tsb = TipusSubjacentBasic::INT;
    this->tipus.empty();

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "-") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * aritExpr -> exprSimple + exprSimple
 * aritExpr -> exprSimple - exprSimple
 * aritExpr -> exprSimple * exprSimple
 * aritExpr -> exprSimple / exprSimple
 * aritExpr -> exprSimple % exprSimple
 */
void SimbolArithmeticExpression::make(Driver *driver, SimbolExpressio a, SimbolExpressio b, int tipus){
    if(a.isNull() || b.isNull()){
        this->makeNull();
        return;
    }

    // només es poden fer operacions aritmètiques entre enters
    if(a.getTSB() != TipusSubjacentBasic::INT || b.getTSB() != TipusSubjacentBasic::INT){
        this->makeNull();
        driver->error( error_tipus_esperat("enter") );
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
                if(b.getMode() == CONST && b.getIntValue() == 0){
                    driver->error( error_divisio_zero() );
                    this->makeNull();
                    return;
                }

                this->intValue = a.getIntValue() / b.getIntValue();
                break;
            
            case 4: // exprSimple % exprSimple:
                if(b.getIntValue() == 0){
                    driver->error( error_divisio_zero() );
                    this->makeNull();
                    return;
                }

                this->intValue = a.getIntValue() % b.getIntValue();
                break;
        }

        this->mode = SimbolExpressio::Mode::CONST;
    }else{
        this->mode = SimbolExpressio::Mode::RESULTAT;
    }

    this->tsb = TipusSubjacentBasic::INT;
    this->tipus.empty();

    // pintar a l'arbre
    this->fills.push_back( std::to_string(a.getNodeId()) );
    switch (tipus) {
        case 0: this->fills.push_back( driver->addTreeChild(this, "+") ); break;
        case 1: this->fills.push_back( driver->addTreeChild(this, "-") ); break;
        case 2: this->fills.push_back( driver->addTreeChild(this, "*") ); break;
        case 3: this->fills.push_back( driver->addTreeChild(this, "/") ); break;
        case 4: this->fills.push_back( driver->addTreeChild(this, "%") ); break;
    }
    this->fills.push_back( std::to_string(b.getNodeId()) );
    Simbol::toDotFile(driver);
}