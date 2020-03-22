#include "SimbolMarcador.h"
#include "../Driver.h"

#include "../code/instructions/SkipInstruction.h"

SimbolMarcador::SimbolMarcador() : Simbol("M"){}
SimbolMarcador::~SimbolMarcador() {}

/**
 * Implementa els diferents marcadors utilitzats
 * M -> lambda
 */
void SimbolMarcador::make(Driver *driver, int tipus){
	// indicar derivació a lambda
	Simbol::makeEmpty();
    Simbol::toDotFile(driver);

	// generació de codi en funció del tipus
	switch (tipus) {
		case 0:
			this->et = driver->code.addLabel();
			driver->code.addInstruction(new SkipInstruction(Label()));
			break;
		case 1:
			//this->seg.(driver->code.addInstruction(new GoToInstruction(this->et)));

			this->et = driver->code.addLabel();
			driver->code.addInstruction(new SkipInstruction(Label()));
	}
}

Label SimbolMarcador::getLabel() {
	return this->et;
}

std::vector<Instruction * > SimbolMarcador::getSeg(){
	return this->seg;
}