#include "Variable.h"

int tmpCounter = 0;

Variable::Variable(){
	// no té nom, és temporal
	this->name = "t" + std::to_string(tmpCounter++);
}

Variable::Variable(std::string name){
	this->name = name;
}

Variable::~Variable(){};