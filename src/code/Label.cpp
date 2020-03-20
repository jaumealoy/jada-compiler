#include "Label.h"

int Label::counter = 0;

Label::Label(){
	this->labelId = Label::counter++;
	this->name = "e" + std::to_string(this->labelId);
}

Label::~Label(){}

int Label::getId(){
	return this->labelId;
}

std::string Label::toString(){
	return this->name;
}