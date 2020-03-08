#include "Label.h"

int Label::counter = 0;

Label::Label(){
	this->labelId = Label::counter++;
}

Label::~Label(){}