#include "ElementList.h"
#include <cstring>

ElementList::ElementList(int numElements, unsigned int elementSize){
	this->numElements = numElements;
	this->elementSize = elementSize;

	// inicialitzar l'array que contendrà els elements
	this->data = new char*[numElements];
	for(int i = 0; i < numElements; i++){
		this->data[i] = nullptr;
	}
}

ElementList::~ElementList(){
	// eliminar les dades guardes
	for(int i = 0; i < this->numElements; i++){
		if(this->data[i] != nullptr){
			//delete[] this->data[i];
			//this->data[i] = nullptr;
		}
	}

	//delete[] this->data;
}

void ElementList::add(void *ptr){
	if(this->lastElement == (this->numElements - 1)){
		// no hi ha espai per més elements
		return;
	}

	// obtenir l'índex on s'ha de guardar l'element
	int idx = this->lastElement++;

	this->data[idx] = new char[this->elementSize];
	std::memcpy(this->data[idx], ptr, this->elementSize);
}

void * ElementList::get(int i){
	return this->data[i];
}