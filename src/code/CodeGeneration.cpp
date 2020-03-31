#include "CodeGeneration.h"
#include "Label.h"
#include "instructions/GoToInstruction.h"
#include "instructions/CondJumpInstruction.h"
#include <iostream>

CodeGeneration::CodeGeneration(){
	this->first = nullptr;
	this->last = nullptr;

	this->variableCounter = 0;
	this->labelCounter = 0;
	this->subprogramCounter = 0;

	// inicialment no s'està dins cap subprograma
	// però es permeten variables globals, per simplificar el control
	// es crearà un subprograma que representa tot el subprograma
	this->nivellProfunditat = 0;
	SubProgram *global = new SubProgram(this->nivellProfunditat, "_start");
	this->subprogrames.push(global);
}

CodeGeneration::~CodeGeneration(){
	// eliminar totes les instruccions
	while(this->first != nullptr){
		this->last = this->first->getNext();
		delete this->first;
		this->first = this->last;
	}

	this->first = nullptr;
	this->last = nullptr;
}

/**
 * Afegeix una instrucció al final del codi generat
 */
Instruction * CodeGeneration::addInstruction(Instruction *inst){
	if(this->first == nullptr){
		// és la primera instrucció que es crea
		this->first = inst;
		this->last = inst;
	}else{
		// hi ha altres instruccions, s'insereix al final
		this->last->setNext(inst);
		inst->setPrevious(this->last);
		this->last = inst;
	}

	// indicar que aquesta instrucció es troba dins un determinat nivell
	inst->setInvokingSubProgram(this->subprogrames.top());

	return inst;
}

/**
 * Crea i retorna una nova etiqueta
 */
Label CodeGeneration::addLabel(){
	return Label(++this->labelCounter);
}

/**
 * Crea i retorna una nova variable, amb nom o sense
 */
Variable *CodeGeneration::addVariable(TipusSubjacentBasic tsb){
	// el subprograma actual és
	SubProgram *actual = this->subprogrames.top();

	Variable *tmp = this->vars.add(
		new Variable(actual, ++this->variableCounter)
	);

	// indicar l'ocupació
	tmp->setOcupacio(tsb);

	return tmp;
}

Variable *CodeGeneration::addVariable(TipusSubjacentBasic tsb, std::string name){
	// el subprograma actual és
	SubProgram *actual = this->subprogrames.top();

	Variable *tmp = this->vars.add(
		new Variable(actual, ++this->variableCounter, name)
	);

	// indicar l'ocupació
	tmp->setOcupacio(tsb);

	return tmp;
}

/**
 * Crea un subprograma a la generació de codi
 */
SubProgram *CodeGeneration::addSubProgram(std::string id, Label label) {
	// el nivell d'aquest subprograma és l'actual
	return new SubProgram(this->nivellProfunditat + 1, id);
}

/**
 * L'acció d'entar dins un subprograma suposa que totes les variables
 * creades a continuació estaran definides dins aquest subprograma
 */
void CodeGeneration::enterSubProgram(SubProgram *subprogram) {
	this->subprogrames.push(subprogram);
	this->nivellProfunditat = subprogram->getNivellProfunditat();
}

/**
 * Recuperar el subprograma anterior.
 * En cas de no tenir cap subprograma es produirà un error
 */
void CodeGeneration::leaveSubProgram() {
	this->subprogrames.pop();
	this->nivellProfunditat = this->subprogrames.top()->getNivellProfunditat();
}

/**
 * Escriu el codi actual a un arxiu de text
 */
void CodeGeneration::writeToFile(std::ofstream &file){
	Instruction *act = this->first;
	while(act != nullptr){
		file << act->toString() << std::endl;
		act = act->getNext();
	}
}

/**
 * Generació de codi assemblador.
 * 1) generar les diferents seccions (.data, .bss i .text)
 * 1.1) .data són les variables inicialitzades, variables globals inicialitzades
 * 1.2) .bss són variables globals sense inicialitzar
 * 1.3) .text és el programa (subprogrames i instruccions)
 */
void CodeGeneration::generateAssembly(std::ofstream &file) {
	// primer s'han d'actualitzar les taules (amb aquest ordre)
	this->updateSubProgramTable();
	this->updateVariableTable();

	// si s'ha arribat fins aquí, segur que la pila de subprogrames conté
	// el "subprograma" que s'ha creat artificialment
	SubProgram *start = this->subprogrames.top();

	// secció .data
	file << ".data" << std::endl;

	// secció .bss
	file << ".bss" << std::endl;

	// variables globals no inicialitzades
	// TODO: la inicialització de variables sempre es fa en temps d'execució
	for(int i = 0; i < this->vars.size(); i++){
		Variable *tmp = this->vars.get(i);
		if(tmp->getSubPrograma() != start) continue;
		
		file << "\t" << tmp->getAssemblyTag();
		file << "\t.fill\t" << tmp->getOcupacio() << ", 1, 0";
		file << std::endl;
	}
	
	file << ".text" << std::endl;

	// ara es pot representar cada instrucció
	Instruction *act = this->first;
	while(act != nullptr){
		file << act->generateAssembly() << std::endl;
		act = act->getNext();
	}

	std::cout << "Final assembly" << std::endl;
}

/**
 * Substitueix l'etiqueta dels salts (condicionals o no) per l'etiqueta
 * passada per paràmetre
 */
void CodeGeneration::backpatch(Label e, Instruction *v) {
	switch (v->getType()) {
		case Instruction::Type::GOTO: 
			((GoToInstruction *) v)->setLabel(e); 
			break;

		case Instruction::Type::CONDJUMP:
			((CondJumpInstruction *) v)->setLabel(e);
			break;
	}
}

void CodeGeneration::backpatch(Label e, std::vector<Instruction *> v) {
	for(int i = 0; i < v.size(); i++) {
		this->backpatch(e, v[i]);
	}
}

void CodeGeneration::backpatch(Label e, std::list<Instruction *> v) {
	std::list<Instruction *>::iterator it = v.begin();
	while(it != v.end()){
		this->backpatch(e, *it);
		it++;
	}
}


/**
 * Mou les instruccions situades entre start i end (inloses) després d'after
 * start: és la primera instrucció a partir de la qual es vol moure
 * end: és la darrera instrucció que es mourà
 * after: allà on s'inserirà el bloc start-end
 */
void CodeGeneration::move(Instruction *start, Instruction *end, Instruction *after){
	Instruction *aux = start;
	Instruction *tmp;
	while(aux != end){
		tmp = aux->getNext();
		this->move(aux, after);
		after = aux;
		aux = tmp;
	}

	this->move(end, after);
}


/**
 * Situa una instrucció inst després d'after
 * Precondicions: inst != after, inst != null, after != null
 */
void CodeGeneration::move(Instruction *inst, Instruction *after){
	// elimina la instrucció
	this->remove(inst);

	// afegir-la després d'after
	if(after == this->last){
		this->last = inst;
		inst->setNext(nullptr);
	}

	inst->setPrevious(after);
	after->setNext(inst);
}


/**
 * Elimina una instrucció de la llista d'instruccions
 */
void CodeGeneration::remove(Instruction *inst){
	if(inst == this->first){
		// eliminar la primera instrucció de la llista
		this->first = inst->getNext();
		
		if(this->first != nullptr){
			this->first->setPrevious(nullptr);
		}
	}else{
		// no és el primer element
		// inst.prev != null
		inst->getPrevious()->setNext(inst->getNext());

		if(inst->getNext() != nullptr){
			inst->getNext()->setPrevious(inst->getPrevious());
		}
	}

	if(inst == this->last){
		// és el darrer element
		this->last = inst->getPrevious();
	}

	//delete inst;
}

/**
 * Unió de conjunts
 */
std::vector<Instruction *> CodeGeneration::concat(std::vector<Instruction *> list1, std::vector<Instruction *> list2){
	std::vector<Instruction *> tmp;
	tmp.reserve(list1.size() + list2.size());

	for(int i = 0; i < list1.size(); i++){
		tmp.push_back(list1[i]);
	}

	for(int i = 0; i < list2.size(); i++){
		tmp.push_back(list2[i]);
	}

	return tmp;
}

std::list<Instruction *> CodeGeneration::concat(std::list<Instruction *> list1, std::list<Instruction *> list2){
	std::list<Instruction *> tmp;

	std::list<Instruction *>::iterator it = list1.begin();
	while(it != list1.end()){
		tmp.push_back(*it);
		it++;
	}

	it = list2.begin();
	while(it != list2.end()){
		tmp.push_back(*it);
		it++;
	}

	return tmp;
}

/**
 * Converteix un conjunt vector a una estructura llista
 */
std::list<Instruction *> CodeGeneration::convert(std::vector<Instruction *> list) {
	std::list<Instruction *> tmp;

	std::vector<Instruction *>::iterator it = list.begin();
	while(it != list.end()){
		tmp.push_back(*it);
		it++;
	}

	return tmp;
}

/**
 * Actualització de la taula de variables.
 * Per cada variable, s'ha d'actualitzar el seu offset tenint en compte
 * la mida del subprograma.
 * 
 * Les variables locals comencen a l'offset = 0
 */
void CodeGeneration::updateVariableTable() {
	// totes les variables tenen un subprograma vàlid associat
	for(int i = 0; i < this->vars.size(); i++){
		Variable *actual = this->vars.get(i);
		SubProgram *subprograma = actual->getSubPrograma();

		if(subprograma == nullptr) {
			std::cerr << "Variable " << actual->getNom() << " no té subprograma" << std::endl;
			continue;
		}

		int currentOffset = subprograma->getOcupacioVariables();
		actual->setOffset(currentOffset);

		// actualitzar l'ocupació de les variables del subprograma
		subprograma->setOcupacioVariables(currentOffset + actual->getOcupacio());
	}
}

/**
 * Actualització de la taula de subprogrames
 * Tots els subprogrames tenen una ocupació de 0
 */
void CodeGeneration::updateSubProgramTable() {
	for(int i = 0; i < this->programs.size(); i++) {
		// reiniciar el comptador de l'ocupació de variables
		this->programs.get(i)->setOcupacioVariables(0);
	}
}

/**
 * Retorna el sufix o l'etiqueta d'una determinada mida
 */
std::string CodeGeneration::getSizeTag(bool instructionTag, int mida) {
	std::string tmp = "";

	switch (mida) {
		case 1: 
			if (instructionTag) {
				tmp = "b";
			} else {
				tmp = "byte";
			}

			break;
			
		case 4:
			if (instructionTag) {
				tmp = "l";
			} else {
				tmp = "long";
			}

			break;

		case 8:
			if (instructionTag) {
				tmp = "q";
			} else {
				tmp = "quad";
			}

			break;
	}

	return tmp;
}

std::string CodeGeneration::getSizeTag(bool instructionTag, TipusSubjacentBasic tsb) {
	return getSizeTag(instructionTag, TSB::sizeOf(tsb));
}
