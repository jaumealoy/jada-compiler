#ifndef _H_SIMBOL_STATEMENT_FOR
#define _H_SIMBOL_STATEMENT_FOR

#include "Simbol.h"
#include "SimbolStatement.h"
#include "SimbolBloc.h"
#include "SimbolExpressio.h"
#include "SimbolForInit.h"
#include "SimbolForPostExpression.h"

class SimbolForStatement : public SimbolStatement {
private:
public: 
    SimbolForStatement();
    ~SimbolForStatement();

    void make(Driver *driver, SimbolForInit init, SimbolExpressio exp, SimbolForPostExpression post, SimbolBloc bloc);
};

#endif