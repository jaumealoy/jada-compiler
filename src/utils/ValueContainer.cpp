#include "ValueContainer.h"
#include <cstring>
#include <iostream>

ValueContainer::ValueContainer(){
	this->value = nullptr;
	this->valueSize = 0;
}

ValueContainer::ValueContainer(const char *value, unsigned int valueSize){
	this->valueSize = valueSize;
	this->value = nullptr;
	this->value = new char[valueSize];

	// copiar el contingut
	memcpy(this->value, value, valueSize);
}

ValueContainer::~ValueContainer(){
	if(this->value){
		delete []this->value;
		this->value = nullptr;
	}
}

char *ValueContainer::get(){
	return this->value;
}

void ValueContainer::set(const char *value, unsigned int valueSize){
	this->valueSize = valueSize;
	this->value = nullptr;
	this->value = new char[valueSize];

	// copiar el contingut
	memcpy(this->value, value, valueSize);
}

unsigned int ValueContainer::getSize(){
	return this->valueSize;
}