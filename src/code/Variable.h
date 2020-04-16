#ifndef _H_CODE_VARIABLE
#define _H_CODE_VARIABLE

#include "../taulasimbols/TipusSubjacentBasic.h"
#include "SubProgram.h"
#include "../utils/ValueContainer.h"
#include <string>
#include <memory>

class Variable {
private:
	int id;
	std::string name;

	// interessa poder tenir "variables" nul·les, cosa que pot ser
	// servir al desplaçament per indicar que no n'hi ha
	//bool null;

	// indica si una variable és o no un paràmetre d'un subprograma
	bool parameter;

	// dades de la variable
	TipusSubjacentBasic tsb;
	int ocupacio;
	int ocupacioExtra;
	int offset;

	// indica de quin subprograma és (en quin subprograma s'ha declarat)
	SubProgram *subprograma;

	// una variable constant és aquella en què només es fa una assignació
	// de l'estil variable = <constant>
	bool constant;
	bool locked;
	bool firstTime;
	std::shared_ptr<ValueContainer> valor;

public:
	Variable();
	Variable(SubProgram *, int id, bool);
	Variable(SubProgram *, int id, std::string name, bool parameter);
	~Variable();

	//bool isNull();
	//void makeNull();

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

	// gestió de si és o no constant
	bool isConstant();
	void resetConstant();
	void setConstant(std::shared_ptr<ValueContainer> valor);
	void setConstant(bool constant);
	void lockConstant();
	std::shared_ptr<ValueContainer> getValor();
};

#endif