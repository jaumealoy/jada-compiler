#ifndef _H_SIMBOL_ELSEIF_STATEMENT
#define _H_SIMBOL_ELSEIF_STATEMENT

#include "SimbolStatement.h"
#include "SimbolBloc.h"
#include "SimbolElseStatement.h"
#include "SimbolMarcador.h"

class SimbolElseIfStatement : public SimbolStatement {
private:
	// instruccions que han d'anar al final del l'if
	std::list<Instruction *> finals;
public:
    SimbolElseIfStatement();
    ~SimbolElseIfStatement();

    void make(Driver *driver, SimbolElseIfStatement elseif, SimbolMarcador einici, SimbolExpressio exp, SimbolMarcador ebloc, SimbolBloc bloc);
    void make(Driver *driver, SimbolExpressio exp, SimbolMarcador ebloc, SimbolBloc bloc);

	std::list<Instruction *> getFinals();
};

#endif