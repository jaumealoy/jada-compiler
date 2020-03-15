#include "Variable.h"

int tmpCounter = 0;

Variable::Variable(bool null){
	if(null){
		// no és realment una variable
		this->null = true;
	}else{
		// no té nom, és temporal
		this->name = "t" + std::to_string(tmpCounter++);
		this->null = false;
	}
}

Variable::Variable(){
	// no té nom, és temporal
	this->name = "t" + std::to_string(tmpCounter++);
	this->null = false;
}

Variable::Variable(std::string name){
	this->name = name;
	this->null = false;
}

Variable::~Variable(){};

std::string Variable::getNom() {
	return this->name;
}

bool Variable::isNull(){
	return this->null;
}