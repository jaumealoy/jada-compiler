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
	return inst;
}

/**
 * Crea i retorna una nova etiqueta
 */
Label CodeGeneration::addLabel(){
	return Label(++this->labelCounter);
}

Variable CodeGeneration::addVariable(){
	return Variable(false, ++this->variableCounter);
}

Variable CodeGeneration::addVariable(std::string name){
	return Variable(++this->variableCounter, name);
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
