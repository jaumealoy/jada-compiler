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

	// indica si una variable és o no un paràmetre d'un subprograma
	bool parameter;

	// dades de la variable
	TipusSubjacentBasic tsb;
	int ocupacio;
	int ocupacioExtra;
	int offset;

	// indica de quin subprograma és
	SubProgram *subprograma;

public:
	Variable();
	Variable(SubProgram *, int id, bool);
	Variable(SubProgram *, int id, std::string name, bool parameter);
	~Variable();

	bool isNull();
	void makeNull();

	std::string getNom();
	std::string getAssemblyTag();

	// gestió de l'offset
	void setOffset(int);
	int getOffset();
	bool isParameter();

	// gestió de l'ocupació
	void setOcupacio(TipusSubjacentBasic tsb);
	void setOcupacio(TipusSubjacentBasic tsb, TipusSubjacentBasic unitari);
	int getOcupacio();

	int getOcupacioExtra();
	void setOcupacioExtra(int ocupacio);

	TipusSubjacentBasic getTSB();

	SubProgram *getSubPrograma();
};

#endif