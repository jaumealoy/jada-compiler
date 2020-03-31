#include "SimbolElseStatement.h"
#include "SimbolElseIfStatement.h"
#include "../Driver.h"

SimbolElseStatement::SimbolElseStatement() : SimbolStatement() {
    this->nomNode = "ElseStatement";
}

SimbolElseStatement::~SimbolElseStatement(){}

/**
 * elseStatement -> elseIfStatement else do M0 bloc
 */
void SimbolElseStatement::make(Driver *driver, SimbolElseIfStatement elseif, SimbolMarcador marc, SimbolBloc bloc){
    this->propaga(elseif, bloc);

    this->fills.push_back( std::to_string(elseif.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "else do") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );

    Simbol::toDotFile(driver);

	// indicar que el següent bloc comença a marc.label
	driver->code.backpatch(marc.getLabel(), elseif.getSeg());

	// no importa afegir una instrucció després de bloc per indicar el final
	// ja és el final
    this->seg = bloc.getSeg();
	this->finals = elseif.getFinals();
}

/**
 * elseStatement -> elseIfStatement
 */
void SimbolElseStatement::make(Driver *driver, SimbolElseIfStatement elseif){
    this->propaga(elseif);

    this->fills.push_back( std::to_string(elseif.getNodeId()) );
    Simbol::toDotFile(driver);

    this->seg = elseif.getSeg();
	this->finals = elseif.getFinals();
}

std::list<Instruction *> SimbolElseStatement::getFinals(){
	return this->finals;
}