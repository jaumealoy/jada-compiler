#include "DescripcioProc.h"

DescripcioProc::DescripcioProc(SubProgram *subprogram) 
	: Descripcio(Descripcio::Tipus::PROCEDIMENT) 
{
	this->subprograma = subprogram;
}

DescripcioProc::~DescripcioProc() {}

SubProgram *DescripcioProc::getSubPrograma() {
	return this->subprograma;
}