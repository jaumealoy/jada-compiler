#include "SimbolVarInit.h"
#include "../taulasimbols/Descripcio.h"
#include "../Driver.h"

SimbolVarInit::SimbolVarInit() : SimbolExpressio() {
    this->nomNode = "VarInit";
}

SimbolVarInit::~SimbolVarInit(){}

/**
 * varInit -> = exprSimple
 */
void SimbolVarInit::make(Driver *driver, SimbolExpressio exp){
    this->tipus = exp.getTipus();
    this->tsb = exp.getTSB();
    this->mode = exp.getMode();

    this->intValue = exp.getIntValue();
    this->charValue = exp.getCharValue();
    this->boolValue = exp.getBoolValue();

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "=") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * varInit -> = arrayInit
 */
void SimbolVarInit::make(Driver *driver, SimbolArrayInit exp){
    this->tipus = exp.getTipus();
    this->tsb = exp.getTSB();
    this->mode = exp.getMode();

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "=") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    Simbol::toDotFile(driver);
}
