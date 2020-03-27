#include "Variable.h"

int tmpCounter = 0;

Variable::Variable(){
	this->id = -1;
	this->name = "mal ús de Variable: no pots crear Variables directament";
	this->null = false;
}

Variable::Variable(bool null){
	this->id = -1;
	this->null = null;
	
	if(!null){
		this->name = "mal ús de Variable: no pots crear Variables directament";
	}
}

Variable::Variable(bool null, int id){
	this->id = id;

	if(null){
		// no és realment una variable
		this->null = true;
	}else{
		// no té nom, és temporal
		this->name = "t" + std::to_string(id);
		this->null = false;
	}
}

Variable::Variable(int id){
	// no té nom, és temporal
	this->id = id;
	this->name = "t" + std::to_string(id);
	this->null = false;
}

Variable::Variable(int id, std::string name){
	this->id = id;
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

void Variable::makeNull(){
	this->null = true;
}