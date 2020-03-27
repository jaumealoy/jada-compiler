#include "SimbolForPostExpression.h"
#include "../Driver.h"

SimbolForPostExpression::SimbolForPostExpression() : Simbol("ForPostExpression") {
	this->begin = nullptr;
	this->end = nullptr;
}

SimbolForPostExpression::~SimbolForPostExpression() {}

/**
 * forPostExpression -> lambda
 */
void SimbolForPostExpression::make(Driver *driver){
    this->makeEmpty();
    Simbol::toDotFile(driver);
}

/**
 * forPostExpression -> M2 expression M2
 */
void SimbolForPostExpression::make(Driver *driver, SimbolAssignacio assig, SimbolMarcador m1, SimbolMarcador m2){
    // i pintar a l'arbre
    this->fills.push_back( std::to_string(m1.getNodeId()) );
    this->fills.push_back( std::to_string(assig.getNodeId()) );
    this->fills.push_back( std::to_string(m2.getNodeId()) );
    Simbol::toDotFile(driver);

	this->begin = m1.getInstruction();
	this->end = m2.getInstruction();
}

Instruction * SimbolForPostExpression::getBegin(){
	return this->begin;
}

Instruction * SimbolForPostExpression::getEnd(){
	return this->end;
}
