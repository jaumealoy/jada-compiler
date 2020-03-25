#include "SimbolSwitchStatement.h"
#include "../code/instructions/SkipInstruction.h"
#include "../Driver.h"

SimbolSwitchStatement::SimbolSwitchStatement() : SimbolStatement() {
    this->nomNode = "SwitchStatement";
}

SimbolSwitchStatement::~SimbolSwitchStatement(){}

/**
 * switchStatement -> switch ( contSwitch end
 */
void SimbolSwitchStatement::make(Driver *driver, SimbolContSwitch cont) {
    this->propaga(cont);

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "switch (") );
    this->fills.push_back( std::to_string(cont.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end") );
    Simbol::toDotFile(driver);

	// indicar el final
	driver->code.addInstruction(new SkipInstruction(cont.getFi()));

	// canviar les etiquetes anteriors
	driver->code.backpatch(cont.getFi(), cont.getPreviousCondJump());
	driver->code.backpatch(cont.getFi(), cont.getPreviousGoTo());
	
}
