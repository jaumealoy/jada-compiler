#include "SimbolAssignacio.h"
#include "../Driver.h"

SimbolAssignacio::SimbolAssignacio(){

}

SimbolAssignacio::~SimbolAssignacio(){

}

/**
 * Les següents expressions no tenen un valor de tornada
 * 
 * expression -> referencia = exprSimple
 * expression -> referencia += exprSimple
 * expression -> referencia /= exprSimple
 * expression -> referencia *= exprSimple
 * expression -> referencia -= exprSimple
 */
void SimbolAssignacio::make(Driver *driver, SimbolReferencia ref, SimbolExpressio exp, int tipus){
    if(ref.isNull() || exp.isNull()){
        return;
    }

    // Comprovar que la referència és una variable
    if(ref.getMode() != SimbolReferencia::ModeMVP::VAR){
        driver->error("referència no accessible");
        return;
    }

    // Comprovar que els tipus de referència i exprSimple són compatibles
    if(ref.getTipus() != exp.getTipus() && !ref.getTipus().empty()){
        driver->error("tipus incompatibles");
        return;
    }else{
        if(ref.getTSB() != exp.getTSB()){
            driver->error("tipus incompatibles");
            return;
        }
    }
}

/**
 * expression -> referencia++
 * expression -> referencia--
 */
void SimbolAssignacio::make(Driver *driver, SimbolReferencia ref, int tipus){
    if(ref.isNull()){
        // ja s'haurà mostrat l'error a qualque altre banda
        return;
    }

    // Comprovar que la referència és una variable
    if(ref.getMode() != SimbolReferencia::ModeMVP::VAR){
        driver->error("referència no accessible");
        return;
    }

    // només és possible amb enters
    if(ref.getTSB() != TipusSubjacentBasic::INT){
        driver->error("");
    }
}
