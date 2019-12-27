#include "SimbolElseIfStatement.h"
#include "../Driver.h"

SimbolElseIfStatement::SimbolElseIfStatement() : SimbolStatement() {

}

SimbolElseIfStatement::~SimbolElseIfStatement(){}

/**
 * elseIfStatement -> else if exprSimple do bloc end elseIfStatement
 */
void SimbolElseIfStatement::make(Driver *driver, SimbolExpressio exp, SimbolBloc bloc, SimbolElseIfStatement elseIf){
    // comprovar que l'expressió és un boolean
    if(exp.getTSB() != TipusSubjacentBasic::BOOLEAN){
        driver->error("s'espera un boolean");
    }

    // propagar els possibles returns i breaks que benguin de bloc i elseIfStatement
    this->propaga(bloc, elseIf);
}

/**
 * elseIfStatement -> elseStatement
 */
void SimbolElseIfStatement::make(Driver *driver, SimbolElseStatement elseBloc){
    if(!elseBloc.isEmpty()){
        // no és una derivació a lambda
        // s'hauran de propagar els possibles valors de retorn i break
        this->propaga(elseBloc);
    }
}

