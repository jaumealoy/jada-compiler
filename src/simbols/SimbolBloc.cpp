#include "SimbolBloc.h"
#include "../Driver.h"

void SimbolBloc::make(Driver *driver, SimbolStatementList list){
    // Propaga els returns i breaks al bloc actual
    this->propaga(list);
}