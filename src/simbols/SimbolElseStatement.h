#ifndef _H_SIMBOL_ELSE_STATEMENT
#define _H_SIMBOL_ELSE_STATEMENT

#include "SimbolStatement.h"
#include "SimbolBloc.h"


class SimbolElseStatement : public SimbolStatement {
private:
public:
    SimbolElseStatement();
    ~SimbolElseStatement();

    void make(Driver *driver, SimbolBloc bloc);
    void make(Driver *driver);
};

#endif