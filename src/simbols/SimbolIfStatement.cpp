#include "SimbolIfStatement.h"

SimbolIfStatement::SimbolIfStatement() : SimbolStatement() {}
SimbolIfStatement::~SimbolIfStatement() { }

void SimbolIfStatement::make(Driver *driver, SimbolBloc bloc) {
    // Qualsevol part de l'if no atura la propagació dels returns o breaks
    this->propaga(bloc);
}