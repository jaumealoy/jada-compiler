#ifndef _H_SIMBOL_IF_STATEMENT
#define _H_SIMBOL_IF_STATEMENT

#include "SimbolStatement.h"
#include "SimbolBloc.h"

class SimbolIfStatement : public SimbolStatement {
private:
public:
    SimbolIfStatement();
    ~SimbolIfStatement();

    void make(Driver *driver, SimbolBloc bloc);
};

#endif