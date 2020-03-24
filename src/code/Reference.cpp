#include "Reference.h"
#include "../Driver.h"
#include "instructions/AssignmentInstruction.h"

Reference::Reference(){}
Reference::~Reference(){}

Reference::Reference(Variable r, Variable d){
	this->r = r;
	this->d = d;
}

Variable Reference::dereference(Driver *driver){
	// crear variable resultant
	Variable tmp = driver->code.addVariable();

	if(this->d.isNull()){
		// no hi ha desplaçament en temps d'exeució
		tmp = this->r;
	}else{
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


Variable Reference::getBase(){
	return this->r;
}

Variable Reference::getOffset(){
	return this->d;
}