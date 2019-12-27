#include "SimbolRelExpr.h"
#include "../Driver.h"

SimbolRelExpr::SimbolRelExpr() : SimbolExpressio() {}
SimbolRelExpr::~SimbolRelExpr() {}

/**
 *  RelExpr -> ExprSimple [OP_NEQ/OP_EQ/OP_GT...] ExprSimple
 * 
 * tipus = 0 (NEQ)
 *         1 (EQ)
 *         2 (GT)
 *         3 (GTE)
 *         4 (LT)
 *         5 (LTE)
 */
void SimbolRelExpr::make(Driver *driver, SimbolExpressio a, SimbolExpressio b, int tipus){
    if (a.isNull() || b.isNull()) {
        //Ignorar
        this->makeNull();
        return;
    }

    if ((a.getTSB() != INT) && (a.getTSB() != CHAR) && (a.getTSB() != BOOLEAN)) {     
        driver->error("Expressió no comparable.");
    }

    if ((b.getTSB() != INT) && (b.getTSB() != CHAR) && (b.getTSB() != BOOLEAN)) {     
        driver->error("Expressió no comparable.");
    }    

    if (a.getTSB() != b.getTSB()) {
        driver->error("Expressions de diferent tipus subjacent.");
    }

    if (!(a.getTipus().empty() || b.getTipus().empty())) {
        if (a.getTipus() != b.getTipus()) {
            driver-> error("Expressions de diferent tipus.");
        }
    }

    TipusSubjacentBasic tmp = a.getTSB();

    // calcular el valor resultant si les dues expressions són constants
    if(a.getMode() == b.getMode() && a.getMode() == SimbolExpressio::Mode::CONST){
        switch (tipus) {
            case 0:  // NEQ
                switch (tmp) {
                    case BOOLEAN:
                        this->boolValue = a.getBoolValue() != b.getBoolValue();
                        break;
                    case INT:
                        this->boolValue = a.getIntValue() != b.getIntValue();
                        break;
                }

                break;
            
            case 1: // EQ
                switch (tmp) {
                    case BOOLEAN:
                        this->boolValue = a.getBoolValue() == b.getBoolValue();
                        break;
                    case INT:
                        this->boolValue = a.getIntValue() == b.getIntValue();
                        break;
                }

                break;

            case 2: // GT
                switch (tmp) {
                    case BOOLEAN:
                        this->boolValue = a.getBoolValue() > b.getBoolValue();
                        break;
                    case INT:
                        this->boolValue = a.getIntValue() > b.getIntValue();
                        break;
                }

                break;

            case 3: // GTE
                switch (tmp) {
                    case BOOLEAN:
                        this->boolValue = a.getBoolValue() >= b.getBoolValue();
                        break;
                    case INT:
                        this->boolValue = a.getIntValue() >= b.getIntValue();
                        break;
                }

                break;
            
            case 4: // LT
                switch (tmp) {
                    case BOOLEAN:
                        this->boolValue = a.getBoolValue() < b.getBoolValue();
                        break;
                    case INT:
                        this->boolValue = a.getIntValue() < b.getIntValue();
                        break;
                }

                break;

            case 5: // LTE
                switch (tmp) {
                    case BOOLEAN:
                        this->boolValue = a.getBoolValue() <= b.getBoolValue();
                        break;
                    case INT:
                        this->boolValue = a.getIntValue() <= b.getIntValue();
                        break;
                }

                break;
        }
    }else{
        this->mode = SimbolExpressio::Mode::RESULTAT;
    }
    
    this->tipus.clear();
    this->tsb = BOOLEAN;
}