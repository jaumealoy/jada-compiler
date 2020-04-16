#include "Variable.h"

int tmpCounter = 0;

Variable::Variable(){
	this->id = -1;
	this->name = "mal ús de Variable: no pots crear Variables directament";
	this->subprograma = nullptr;
	this->constant = false;
	this->locked = false;
}

Variable::Variable(SubProgram *program, int id, bool parameter){
	// no té nom, és temporal
	this->id = id;
	this->name = "t" + std::to_string(id);
	this->subprograma = program;
	this->parameter = parameter;
	this->constant = false;
	this->locked = false;
}

Variable::Variable(SubProgram *program, int id, std::string name, bool parameter){
	this->id = id;
	this->name = name;
	this->subprograma = program;
	this->parameter = parameter;
	this->constant = false;
	this->locked = false;
}

Variable::~Variable(){};

std::string Variable::getNom() {
	if(this->constant){
		long valor;
		
		switch (TSB::sizeOf(this->tsb)) {
			case 1:
				valor = (long) *this->valor->get();
				break;

			case 4:
				valor = (long) *(int *) this->valor->get();
				break;

			case 8:
				valor = *(long *) this->valor->get();
				break;
		}

		return std::to_string(valor);
	}else{
		return this->name;
	}
}

std::string Variable::getAssemblyTag() {
	return "var" + std::to_string(this->id);	
}

/*bool Variable::isNull(){
	return this->null;
}

void Variable::makeNull(){
	this->null = true;
}*/

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

bool Variable::isConstant(){
	return this->constant;
}

/**
 * Indica que la variable pot ser una constant
 */
void Variable::resetConstant(){
	if(this->locked) return;

	this->constant = false;
	this->locked = false;
	
	if(this->parameter){
		// els paràmetres no poden ser constants (per evitar eliminar variables)
		this->firstTime = false;
	}else{
		this->firstTime = true;
	}
}

/**
 * Actualitza si la variable és una constant o no
 */
void Variable::setConstant(std::shared_ptr<ValueContainer> valor){
	if(this->locked) return;

	if(this->firstTime){
		// no s'ha fet cap altre assignació i s'està assginant un valor constant
		this->firstTime = false;
		this->constant = true;
		this->valor = valor;
	}else{
		// s'ha assignat un valor constant però ja s'havia fet una assignació
		// anteriorment
		this->constant = false;
	}
}

void Variable::setConstant(bool constant){
	if(this->locked) return;

	if(this->constant || this->firstTime){
		this->constant = constant;
		this->firstTime = false;
	}
}

std::shared_ptr<ValueContainer> Variable::getValor(){
	return this->valor;
}

/**
 * Indica que aquesta variable serà sempre una constant per evitar els canvis
 * a quan s'aplica resetConstant entre iteracions
 */
void Variable::lockConstant(){
	this->locked = true;
}