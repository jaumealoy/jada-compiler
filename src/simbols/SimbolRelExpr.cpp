#include "SimbolRelExpr.h"
#include "../Driver.h"

SimbolRelExpr::SimbolRelExpr() {}
SimbolRelExpr::~SimbolRelExpr() {}

/**
 *  RelExpr -> ExprSimple [OP_NEQ/OP_EQ/OP_GT...] ExprSimple
 */
void SimbolRelExpr::make(Driver *driver, SimbolExpressio a, SimbolExpressio b){
    
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
    
    this->tipus.clear();
    this->tsb = BOOLEAN;
    this->mode = RESULTAT;

}