#ifndef _H_SIMBOL_STATEMENT_SWITCH
#define _H_SIMBOL_STATEMENT_SWITCH

#include "Simbol.h"
#include "SimbolStatement.h"
#include "SimbolExpressio.h"
#include "SimbolCaseBloc.h"

class SimbolSwitchStatement : public SimbolStatement {
private:
public: 
    SimbolSwitchStatement();
    ~SimbolSwitchStatement();

    void make(Driver *driver, SimbolExpressio exp, SimbolCaseBloc bloc);
};

#endif