#ifndef _H_SIMBOL_SWITCH_CASE_CONT
#define _H_SIMBOL_SWITCH_CASE_CONT

#include "Simbol.h"
#include "SimbolExpressio.h"
#include "SimbolMarcador.h"
#include "../utils/ValueContainer.h"
#include "../code/Variable.h"
#include "../code/Label.h"
#include <list>
#include <memory>

class Driver;
class SimbolContSwitch;

class SimbolSwitchCaseCont : public Simbol {
private:
	bool teDefault;
    std::list<std::shared_ptr<ValueContainer>> valors;

	// dades de l'expressió principal
	std::string tipus;
    TipusSubjacentBasic tsb;
	Variable r;

	// etiquetes per la generació de codi
	Label fi;

	Instruction *previousGoTo; // goto incondicional (si no hi ha break)
	Instruction *previousCondJump; // salt condicional d'avaluar la condició

public:
	SimbolSwitchCaseCont();
	~SimbolSwitchCaseCont();

	void make(Driver *driver, SimbolContSwitch cont, SimbolExpressio exp, SimbolMarcador m);

	Instruction *getPreviousGoTo();
	Instruction *getPreviousCondJump();
	Label getFi();

	Variable getVariable();
	TipusSubjacentBasic getTSB();
	std::string getTipus();
	bool hasDefault();
	
	std::list<std::shared_ptr<ValueContainer>> getValors();
};

#endif