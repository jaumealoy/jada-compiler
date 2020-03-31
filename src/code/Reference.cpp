#include "Reference.h"
#include "../Driver.h"
#include "instructions/AssignmentInstruction.h"

Reference::Reference(){
	this->r = nullptr;
	this->d = nullptr;
}

Reference::~Reference(){}

Reference::Reference(Variable *r, Variable *d){
	this->r = r;
	this->d = d;
}

Variable *Reference::dereference(Driver *driver, TipusSubjacentBasic tsb){
	Variable *tmp = nullptr;

	if(this->d == nullptr){
		// no hi ha desplaçament en temps d'exeució
		tmp = this->r;
	}else{
		// crear variable resultant
		tmp = driver->code.addVariable(tsb);

		// hi ha desplaçament tmp = r[d]
		AssignmentInstruction *inst = new AssignmentInstruction(
			AssignmentInstruction::Type::SOURCE_OFF,
			tmp,
			this->r,
			this->d
		);

		driver->code.addInstruction(inst);
	}

	return tmp;
}


Variable *Reference::getBase(){
	return this->r;
}

Variable *Reference::getOffset(){
	return this->d;
}