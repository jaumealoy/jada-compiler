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
		
		case 1:
			// goto incondicional sense destí
			this->inst = driver->code.addInstruction(new GoToInstruction(nullptr));
			this->seg.push_back(this->inst);
			break;

		case 2:
			// és un marcador que crea una instrucció skip
			// que serveix per marcar blocs de codi
			// Aquesta instrucció s'eliminarà en qualque moment
			// No importa que l'etiqueta no existeixi
			this->inst = driver->code.addInstruction(new SkipInstruction(nullptr));
			break;
	}
}

Label *SimbolMarcador::getLabel() {
	return this->et;
}

std::vector<Instruction *> SimbolMarcador::getSeg(){
	return this->seg;
}

Instruction * SimbolMarcador::getInstruction(){
	return this->inst;
}