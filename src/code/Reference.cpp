#include "Reference.h"
#include "../Driver.h"
#include "instructions/ArithmeticInstruction.h"

Reference::Reference(){}
Reference::~Reference(){}

Variable Reference::dereference(Driver *driver){
	// crear variable resultant
	Variable tmp;

	if(this->d.isNull()){
		// no hi ha desplaçament en temps d'exeució
		tmp = this->r;
	}else{
		// hi ha desplaçament
		ArithmeticInstruction *inst = new ArithmeticInstruction(
			ArithmeticInstruction::Type::ADDITION,
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