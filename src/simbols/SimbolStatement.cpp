#include "SimbolStatement.h"
#include <iostream>

SimbolStatement::SimbolStatement() : Simbol(), ControlInstruccions() {

}

SimbolStatement::~SimbolStatement() {

}

void SimbolStatement::make(Driver *driver, SimbolStatement::Tipus tipus){
    if(tipus == SimbolStatement::Tipus::BREAK){
        this->_conteBreak = true;
    }
}