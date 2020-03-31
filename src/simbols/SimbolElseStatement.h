#ifndef _H_SIMBOL_ELSE_STATEMENT
#define _H_SIMBOL_ELSE_STATEMENT

#include "SimbolStatement.h"
#include "SimbolBloc.h"
#include "SimbolMarcador.h"

class SimbolElseIfStatement;

class SimbolElseStatement : public SimbolStatement {
private:
	// instruccions que han d'anar al final del l'if
	std::list<Instruction *> finals;
public:
    SimbolElseStatement();
    ~SimbolElseStatement();

    void make(Driver *driver, SimbolElseIfStatement elseif, SimbolMarcador marc, SimbolBloc bloc);
    void make(Driver *driver, SimbolElseIfStatement elseif);

	std::list<Instruction *> getFinals();
};

#endif