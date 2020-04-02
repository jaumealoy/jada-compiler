#ifndef _H_SUBPROGRAM
#define _H_SUBPROGRAM

#include "Label.h"
#include <string>

class Variable;

class SubProgram {
private:
	int nivellProfunditat;
	std::string nom;

	// dades del subprograma
	Label start;
	int numParametres; // total de paràmetres
	int ocupacioParametres; // "ocupació" dels paràmetres
	int ocupacioVariables; // espai ocupat per variables locals

	// gestió dels offsets de paràmetres i variables
	int currentOffsetVariables;
	int currentOffsetParametres;

public:
    SubProgram(int np, Label start, std::string id);
    ~SubProgram();

	int getNivellProfunditat();
    void setNP(int np);

	void addVariable(Variable *var);
	int getOcupacioVariables();
	//void setOcupacioVariables(int);

	void addParameter(Variable *param);
	//void setOcupacioParametres(int);
	int getOcupacioParametres();

	void resetOffsets();

	std::string getNom();
};

#endif