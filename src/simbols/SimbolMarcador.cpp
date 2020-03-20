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
			driver->code.addInstruction(new SkipInstruction(this->et));
			break;
	}
}

Label SimbolMarcador::getLabel() {
	return this->et;
}