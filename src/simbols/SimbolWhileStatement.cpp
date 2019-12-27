#include "SimbolWhileStatement.h"
#include "../Driver.h"

SimbolWhileStatement::SimbolWhileStatement() : SimbolStatement() {

}

SimbolWhileStatement::~SimbolWhileStatement(){

}

void SimbolWhileStatement::make(Driver *driver, SimbolExpressio exp, SimbolBloc bloc) {
    // És un bucle, pot contenir break al seu interior i no es propaga a l'exterior
    // però és possible que tengui un return, que sí s'hauria de propagar
    this->propaga(bloc);

    // i no es propaga el break
    this->_conteBreak = false;

    // Comprovar que l'expressió del while és un boolean
    if(exp.getTSB() != TipusSubjacentBasic::BOOLEAN){
        driver->error("s'esperava un boolean");
    }
}