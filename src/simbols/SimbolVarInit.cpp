#include "SimbolVarInit.h"
#include "../taulasimbols/Descripcio.h"
#include "../Driver.h"

SimbolVarInit::SimbolVarInit() : SimbolExpressio() {

}

SimbolVarInit::~SimbolVarInit(){}

void SimbolVarInit::make(Driver *driver, SimbolExpressio exp){
    this->tsb = exp.getTSB();
}