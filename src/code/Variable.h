#ifndef _H_CODE_VARIABLE
#define _H_CODE_VARIABLE

#include "../taulasimbols/TipusSubjacentBasic.h"
#include "SubProgram.h"
#include <string>

class Variable {
private:
	int id;
	std::string name;

	// interessa poder tenir "variables" nul·les, cosa que pot ser
	// servir al desplaçament per indicar que no n'hi ha
	bool null;

	// dades de la variable
	TipusSubjacentBasic tsb;
	int ocupacio;
	int offset;

	// indica de quin subprograma és
	SubProgram *subprograma;

public:
	Variable();
	Variable(SubProgram *, int id);
	Variable(SubProgram *, int id, std::string name);
	~Variable();

	bool isNull();
	void makeNull();

	std::string getNom();
	std::string getAssemblyTag();

	void setOffset(int);
	int getOffset();


	// gestió de l'ocupació
	void setOcupacio(TipusSubjacentBasic tsb);
	void setOcupacio(TipusSubjacentBasic tsb, TipusSubjacentBasic unitari);
	int getOcupacio();

	SubProgram *getSubPrograma();
};

#endif