#include "SimbolIfStatement.h"
#include "../Driver.h"

SimbolIfStatement::SimbolIfStatement() : SimbolStatement() {}
SimbolIfStatement::~SimbolIfStatement() { }

void SimbolIfStatement::make(Driver *driver, SimbolExpressio exp, SimbolBloc bloc) {
    // Qualsevol part de l'if no atura la propagació dels returns o breaks
    this->propaga(bloc);

    // Comprovar que l'expressió correspon un boolean
    if(exp.getTSB() != TipusSubjacentBasic::BOOLEAN) {
        // error
        driver->error("boolean expected");
        return;
    }
}