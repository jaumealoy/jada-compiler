#include "CodeGeneration.h"
#include "Label.h"

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
}

/**
 * Crea i retorna una nova etiqueta
 */
int CodeGeneration::addLabel(){
	Label label;
	return label.getId();
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