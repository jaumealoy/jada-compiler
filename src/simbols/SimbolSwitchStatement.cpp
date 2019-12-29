#include "SimbolSwitchStatement.h"
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
}
