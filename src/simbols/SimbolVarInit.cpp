#include "SimbolVarInit.h"
#include "../taulasimbols/Descripcio.h"
#include "../Driver.h"

SimbolVarInit::SimbolVarInit() : SimbolExpressio() {

}

SimbolVarInit::~SimbolVarInit(){}

/**
 * varInit -> = exprSimple
 */
void SimbolVarInit::make(Driver *driver, SimbolExpressio exp){
    this->tipus = exp.getTipus();
    this->tsb = exp.getTSB();
    this->mode = exp.getMode();
}

/**
 * varInit -> = arrayInit
 */
void SimbolVarInit::make(Driver *driver, SimbolArrayInit exp){
    this->tipus = exp.getTipus();
    this->tsb = exp.getTSB();
    this->mode = exp.getMode();
}
