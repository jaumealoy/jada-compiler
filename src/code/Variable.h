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

public:
	std::string name;
private:

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

	// identificadors d'expressions on apareix aquesta variable
	std::list<std::string> expressionList;

	// llista de les instruccions que fan ús d'aquesta expressió
	std::list<Instruction *> useList;

	// insturccions que fan una assignació a la variable (Arithmentic o Assignment)
	std::list<Instruction *> assignmentList;

public:
	Variable();
	Variable(SubProgram *, int id, bool);
	Variable(SubProgram *, int id, std::string name, bool parameter);
	~Variable();

	int getId();

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
	bool isConstant(bool locked);
	void resetConstant();
	void setConstant(std::shared_ptr<ValueContainer> valor);
	void setConstant(bool constant);
	void lockConstant();
	void unlockConstant();
	std::shared_ptr<ValueContainer> getValor();

	// gestió de les expressions
	std::list<std::string> &getExpressionList();
	void resetExpressionList();
	void addExpression(std::string exp);

	// a quines instruccions apareix aquesta variable
	std::list<Instruction *> &getUseList();
	void resetUseList();
	void addUseList(Instruction *inst);

	// quines assignacions ho fan a la variable
	std::list<Instruction *> &getAssignmentList();
	void addAssignment(Instruction *inst);
	void resetAssignmentList();

};

#endif