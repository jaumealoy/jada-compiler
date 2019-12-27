#ifndef _H_SIMBOL_IF_STATEMENT
#define _H_SIMBOL_IF_STATEMENT

#include "SimbolStatement.h"
#include "SimbolBloc.h"
#include "SimbolExpressio.h"
#include "SimbolElseIfStatement.h"

class SimbolIfStatement : public SimbolStatement {
private:
public:
    SimbolIfStatement();
    ~SimbolIfStatement();

    void make(Driver *driver, SimbolExpressio exp, SimbolBloc bloc, SimbolElseIfStatement elseIfStmt);
};

#endif