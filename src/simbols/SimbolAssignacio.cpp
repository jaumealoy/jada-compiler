#include "SimbolAssignacio.h"
#include "../Driver.h"

SimbolAssignacio::SimbolAssignacio() : Simbol("Assignació"){}
SimbolAssignacio::~SimbolAssignacio(){}

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
        driver->error( error_no_variable(ref.getId()) );
        return;
    }

    // Comprovar que els tipus de referència i exprSimple són compatibles
    if(ref.getTipus() != exp.getTipus() && !ref.getTipus().empty() && !exp.getTipus().empty()){
        driver->error( error_tipus_no_compatibles(ref.getTipus(), exp.getTipus()) );
        return;
    }else{
        if(ref.getTSB() != exp.getTSB()){
            driver->error( error_tipus_no_compatibles(ref.getTSB(), exp.getTSB()) );
            return;
        }
    }

    // i pintar a l'arbre
    std::string operadors[] = {"=", "+=", "/=", "*=", "-="};
    this->fills.push_back( std::to_string(ref.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, operadors[tipus]) );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * expression -> referencia--
 * expression -> referencia++
 */
void SimbolAssignacio::make(Driver *driver, SimbolReferencia ref, int tipus){
    if(ref.isNull()){
        // ja s'haurà mostrat l'error a qualque altre banda
        return;
    }

    // Comprovar que la referència és una variable
    if(ref.getMode() != SimbolReferencia::ModeMVP::VAR){
        driver->error( error_no_variable(ref.getId()) );
        return;
    }

    // només és possible amb enters
    if(ref.getTSB() != TipusSubjacentBasic::INT){
        driver->error( error_tipus_no_compatibles_operador(ref.getTSB()) );
    }

    // i pintar a l'arbre
    std::string operadors[] = {"--", "++"};
    this->fills.push_back( std::to_string(ref.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, operadors[tipus]) );
    Simbol::toDotFile(driver);
}
