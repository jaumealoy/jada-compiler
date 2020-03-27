#include "SimbolElseStatement.h"
#include "SimbolElseIfStatement.h"
#include "../Driver.h"

SimbolElseStatement::SimbolElseStatement() : SimbolStatement() {
    this->nomNode = "ElseStatement";
}

SimbolElseStatement::~SimbolElseStatement(){}

/**
 * elseStatement -> else do bloc 
 */
/*void SimbolElseStatement::make(Driver *driver, SimbolMarcador marc, SimbolBloc bloc){
    this->propaga(bloc);

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "else do") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    Simbol::toDotFile(driver);
}*/

//elseStatement : elseIfStatement ELSE DO M0 bloc
void SimbolElseStatement::make(Driver *driver, SimbolElseIfStatement elseif, SimbolMarcador marc, SimbolBloc bloc){
    this->propaga(elseif, bloc);

    this->fills.push_back( std::to_string(elseif.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "else do") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );

    this->final = elseif.final;
    driver->code.backpatch(marc.getLabel(), elseif.getSeg());
    driver->code.backpatch(final, bloc.getSeg());

    Simbol::toDotFile(driver);
}

//elseStatement -> elseIfStatement { $$.make(this->driver, $1);
void SimbolElseStatement::make(Driver *driver, SimbolElseIfStatement elseif){
    this->propaga(elseif);

    this->fills.push_back( std::to_string(elseif.getNodeId()) );
    Simbol::toDotFile(driver);

    this->seg = elseif.getSeg();
    this->final = elseif.final;
}
/**
 * elseStatement -> lambda
 */
/*
void SimbolElseStatement::make(Driver *driver){
    this->makeEmpty();

    // i pintar a l'arbre
    Simbol::toDotFile(driver);
}*/