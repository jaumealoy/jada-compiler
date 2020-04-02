#include "Variable.h"

int tmpCounter = 0;

Variable::Variable(){
	this->id = -1;
	this->name = "mal ús de Variable: no pots crear Variables directament";
	this->null = false;
	this->subprograma = nullptr;
}

Variable::Variable(SubProgram *program, int id, bool parameter){
	// no té nom, és temporal
	this->id = id;
	this->name = "t" + std::to_string(id);
	this->null = false;
	this->subprograma = program;
	this->parameter = parameter;
}

Variable::Variable(SubProgram *program, int id, std::string name, bool parameter){
	this->id = id;
	this->name = name;
	this->null = false;
	this->subprograma = program;
	this->parameter = parameter;
}

Variable::~Variable(){};

std::string Variable::getNom() {
	return this->name;
}

std::string Variable::getAssemblyTag() {
	return "var" + std::to_string(this->id);	
}

bool Variable::isNull(){
	return this->null;
}

void Variable::makeNull(){
	this->null = true;
}

int Variable::getOffset() {
	return this->offset;
}

void Variable::setOffset(int offset) {
	this->offset = offset;
}

/**
 * Actualitza l'ocupació en funció del tipus subjacent bàsic
 */
void Variable::setOcupacio(TipusSubjacentBasic tsb){
	this->tsb = tsb;
	this->ocupacio = TSB::sizeOf(tsb);
}

int Variable::getOcupacio() {
	return this->ocupacio;
}

void Variable::setOcupacioExtra(int ocupacio) {
	this->ocupacioExtra = ocupacio;
}

int Variable::getOcupacioExtra(){
	return this->ocupacioExtra;
}

TipusSubjacentBasic Variable::getTSB(){
	return this->tsb;
}

SubProgram *Variable::getSubPrograma() {
	return this->subprograma;
}

bool Variable::isParameter(){
	return this->parameter;
}