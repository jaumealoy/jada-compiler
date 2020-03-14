#ifndef _H_SIMBOL_STATEMENT_WHILE
#define _H_SIMBOL_STATEMENT_WHILE

#include "Simbol.h"
#include "SimbolStatement.h"
#include "SimbolBloc.h"
#include "SimbolExpressio.h"

class SimbolWhileStatement : public SimbolStatement {
private:
public: 
    SimbolWhileStatement();
    ~SimbolWhileStatement();

	void make(Driver *driver, SimbolExpressio exp, SimbolBloc bloc);
};

#endif