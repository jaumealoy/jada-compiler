#ifndef _H_SIMBOL_CONTSWITCH
#define _H_SIMBOL_CONTSWITCH

#include "Simbol.h"
#include "SimbolStatement.h"
#include "SimbolExpressio.h"
#include "SimbolBloc.h"
#include "SimbolMarcador.h"
#include "SimbolSwitchCaseCont.h"
#include "../code/Label.h"
#include "../code/Variable.h"
#include <list>
#include <memory>

class SimbolContSwitch : public SimbolStatement {
private:
    bool teDefault;
    std::list<std::shared_ptr<ValueContainer>> valors;

	// dades de l'expressió principal
	std::string tipus;
    TipusSubjacentBasic tsb;
	Variable r;

	// etiquetes per la generació de codi
	Label fi;

	std::list<Instruction *> previousGoTo; // goto incondicional (si no hi ha break)
	std::list<Instruction *> previousCondJump; // salt condicional d'avaluar la condició

public: 
    SimbolContSwitch();
    ~SimbolContSwitch();

    void make(Driver *driver, SimbolExpressio exp);
	void make(Driver *driver, SimbolContSwitch cont, SimbolBloc bloc, SimbolMarcador m);
	void make(Driver *driver, SimbolSwitchCaseCont cont, SimbolBloc bloc);

	std::list<Instruction *> getPreviousGoTo();
	std::list<Instruction *> getPreviousCondJump();
	Label getFi();

	Variable getVariable();
	TipusSubjacentBasic getTSB();
	std::string getTipus();
	bool hasDefault();
	
	std::list<std::shared_ptr<ValueContainer>> getValors();
};

#endif