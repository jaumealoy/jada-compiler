#include "SimbolBloc.h"
#include "../Driver.h"

SimbolBloc::SimbolBloc() : Simbol("Bloc") {}
SimbolBloc::~SimbolBloc() {}

void SimbolBloc::make(Driver *driver, SimbolStatementList list){
    // Propaga els returns i breaks al bloc actual
    this->propaga(list);

    // pintar a l'arbre
    this->fills.push_back(std::to_string(list.getNodeId()));
    Simbol::toDotFile(driver);

	// la següent instrucció d'aquest bloc no es coneix encara
	this->seg = list.getSeg();
}