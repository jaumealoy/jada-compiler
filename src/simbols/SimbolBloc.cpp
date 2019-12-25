#include "SimbolBloc.h"
#include "../Driver.h"

void SimbolBloc::make(Driver *driver, SimbolStatementList list){
    // Propaga els returns i breaks al bloc actual
    std::cout << "Block list break = " << list.conteBreak() << std::endl;
    this->propaga(list);
}