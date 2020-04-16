#include "Label.h"
#include "instructions/SkipInstruction.h"

int Label::counter = 0;

Label::Label() : target(nullptr) {
	this->labelId = -1;
	this->name = "mal ús de Label: no pots construir etiquetes directament";
}

Label::Label(int id) : target(nullptr) {
	this->labelId = id;
	this->name = "e" + std::to_string(this->labelId);
}

Label::Label(int id, std::string name) : target(nullptr) {
	this->labelId = id;
	this->name = name;
}

Label::~Label(){}

int Label::getId(){
	return this->labelId;
}

std::string Label::toString(){
	return this->name;
}

/**
 * Indica quina és la instrucció skip de l'etiqueta
 */
void Label::setTargetInstruction(SkipInstruction *inst){
	if(this->target != nullptr){
		// l'etiqueta ja ha estat ubicada
		return;
	}

	this->target = inst;
}

SkipInstruction *Label::getTargetInstruction(){
	return this->target;
}