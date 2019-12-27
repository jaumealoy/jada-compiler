#include "SimbolElseStatement.h"
#include "../Driver.h"

SimbolElseStatement::SimbolElseStatement() : SimbolStatement() {

}

SimbolElseStatement::~SimbolElseStatement(){}

void SimbolElseStatement::make(Driver *driver, SimbolBloc bloc){
    std::cout << "ELSE BREAK = " << bloc.conteBreak() << std::endl;
    this->propaga(bloc);
}