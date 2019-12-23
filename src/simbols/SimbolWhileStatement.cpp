#include "SimbolWhileStatement.h"
#include "../Driver.h"

SimbolWhileStatement::SimbolWhileStatement() : SimbolStatement() {

}

SimbolWhileStatement::~SimbolWhileStatement(){

}

void SimbolWhileStatement::make(Driver *driver, SimbolBloc bloc) {
    // És un bucle, pot contenir break al seu interior i no es propaga a l'exterior
    // però és possible que tengui un return, que sí s'hauria de propagar
    this->propaga(bloc);

    // i no es propaga el break
    this->_conteBreak = false;

    // TODO:
    // Comprovar que l'expressió del while és un boolean
}