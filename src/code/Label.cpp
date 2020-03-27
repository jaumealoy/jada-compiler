#include "Label.h"

int Label::counter = 0;

Label::Label(){
	this->labelId = -1;
	this->name = "mal ús de Label: no pots construir etiquetes directament";
}

Label::Label(int id){
	this->labelId = id;
	this->name = "e" + std::to_string(this->labelId);
}

Label::Label(int id, std::string name){
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