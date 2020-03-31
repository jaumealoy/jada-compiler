#include "SubProgram.h"

SubProgram::SubProgram(int np, std::string id) {
    this->nivellProfunditat = np;
    this->nom = id;

	this->numParamatres = 0;
}

SubProgram::~SubProgram() {};

void SubProgram::setNP(int np) {
    this->nivellProfunditat = np;
}

int SubProgram::getNivellProfunditat() {
	return this->nivellProfunditat;
}

int SubProgram::getOcupacioVariables() {
	return this->ocupacioVariables;
}

void SubProgram::setOcupacioVariables(int ocupacio) {
	this->ocupacioVariables = ocupacio;
}

/**
 * Incrementa el comptador de paràmetres
 */
void SubProgram::addParameter() {
	this->numParamatres++;
}

std::string SubProgram::getNom() {
	return this->nom;
}