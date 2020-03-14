#include "CodeGeneration.h"
#include "Label.h"
#include "instructions/GoToInstruction.h"
#include "instructions/CondJumpInstruction.h"


CodeGeneration::CodeGeneration(){
	this->first = nullptr;
	this->last = nullptr;
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
		this->last = inst;
	}
	return inst;
}

/**
 * Crea i retorna una nova etiqueta
 */
Label CodeGeneration::addLabel(){
	Label label;
	return label;
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

void CodeGeneration::backpatch(Label e, std::vector<Instruction *> v) {
	for(int i = 0; i < v.size(); i++) {
		switch (v[i]->getType()) {
			case Instruction::Type::GOTO: 
				((GoToInstruction *) v[i])->setLabel(e); 
				break;
			case Instruction::Type::CONDJUMP:
				((CondJumpInstruction *) v[i])->setLabel(e);
				break;
		}
	}
}