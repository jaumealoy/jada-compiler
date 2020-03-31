#ifndef _H_SUBPROGRAM
#define _H_SUBPROGRAM

#include "Label.h"
#include <string>

class SubProgram {
private:
	int nivellProfunditat;
	std::string nom;

	// dades del subprograma
	Label start;
	int numParamatres; // total de paràmetres
	int ocupacioVariables; // espai ocupat per variables locals

public:
    SubProgram(int np, std::string id);
    ~SubProgram();

	int getNivellProfunditat();
    void setNP(int np);

	int getOcupacioVariables();
	void setOcupacioVariables(int);

	void addParameter();

	std::string getNom();
};

#endif