#include "SubProgram.h"

SubProgram::SubProgram(int np, std::string id) {
    this->np = np;
    this->id = id;
}

SubProgram::~SubProgram() {};

void SubProgram::setNP(int np) {
    this->np = np;
}