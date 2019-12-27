#include "SimbolSwitchStatement.h"
#include "../Driver.h"

SimbolSwitchStatement::SimbolSwitchStatement() : SimbolStatement() {}

SimbolSwitchStatement::~SimbolSwitchStatement(){}

void SimbolSwitchStatement::make(Driver *driver,SimbolContSwitch cont) {
    this->propaga(cont);
}
