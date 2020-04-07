#ifndef _H_SUBPROGRAM
#define _H_SUBPROGRAM

#include "Label.h"
#include "../taulasimbols/TipusSubjacentBasic.h"
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

	// tipus de retorn
	TipusSubjacentBasic returnTSB;

public:
    SubProgram(int np, Label start, std::string id);
    ~SubProgram();

	int getNivellProfunditat();
    void setNP(int np);

	void addVariable(Variable *var);
	int getOcupacioVariables();

	void addParameter(Variable *param);
	int getOcupacioParametres();

	void resetOffsets();

	std::string getNom();

	void setTipusRetorn(TipusSubjacentBasic tsb);
	int getOffsetRetorn();
};

#endif