#include "Label.h"
#include "instructions/SkipInstruction.h"
#include "BasicBlock.h"

int Label::counter = 0;

Label::Label() : target(nullptr), block(nullptr) {
	this->labelId = -1;
	this->name = "mal ús de Label: no pots construir etiquetes directament";
}

Label::Label(int id) : target(nullptr),  block(nullptr) {
	this->labelId = id;
	this->name = "e" + std::to_string(this->labelId);
}

Label::Label(int id, std::string name) : target(nullptr), block(nullptr) {
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

void Label::setBlock(BasicBlock *block){
	this->block = block;
}

BasicBlock *Label::getBlock(){
	return this->block;
}

bool Label::isUsed(){
	return this->used;
}

void Label::resetUsage() {
	this->used = false;
}

void Label::markUsage(){
	this->used = true;
}