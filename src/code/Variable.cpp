#include "Variable.h"
#include <iostream>

Variable::Variable(){
	this->id = -1;
	this->name = "mal ús de Variable: no pots crear Variables directament";
	this->subprograma = nullptr;
	this->constant = false;
	this->locked = false;
	this->firstTime = true;
}

Variable::Variable(SubProgram *program, int id, bool parameter){
	// no té nom, és temporal
	this->id = id;
	this->name = "t" + std::to_string(id);
	this->subprograma = program;
	this->parameter = parameter;
	this->constant = false;
	this->locked = false;
	this->firstTime = true;
}

Variable::Variable(SubProgram *program, int id, std::string name, bool parameter){
	this->id = id;
	this->name = name;
	this->subprograma = program;
	this->parameter = parameter;
	this->constant = false;
	this->locked = false;
	this->firstTime = true;
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

	std::cout << "Variable final " << this->name << " amb valors locked=" << this->locked << ", constant=" << this->constant << ", firstTime="<< this->firstTime << std::endl;
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
	std::cout << "Bloquejant " << this->name << " amb valors locked=" << this->locked << ", constant=" << this->constant << ", firstTime="<< this->firstTime << std::endl;

	this->locked = true;
}

int Variable::getId(){
	return this->id;
}

std::list<std::string>& Variable::getExpressionList(){
	return this->expressionList;	
}

/**
 * Reinicia la llista d'expressions que fan ús d'aquesta variable
 */
void Variable::resetExpressionList(){
	this->expressionList.clear();
}

/**
 * Indica que l'expressió identificada per exp inclou aquesta variable
 */
void Variable::addExpression(std::string exp){
	// TODO: comprovar que no hi és
	this->expressionList.push_back(exp);
}

std::list<Instruction *>& Variable::getUseList(){
	return this->useList;
}

/**
 * Indica que aquesta variable s'utilitza a la instrucció
 */
void Variable::addUseList(Instruction *inst){
	bool trobat = false;

	std::list<Instruction *>::iterator it = this->useList.begin();
	while(!trobat && it != this->useList.end()){
		it++;
	}
	
	this->useList.push_back(inst);
}

/**
 * Reinicia la llista d'úsos d'aquesta variable
 */
void Variable::resetUseList(){
	this->useList.clear();
}