#ifndef _H_SIMBOL_STATEMENT_SWITCH
#define _H_SIMBOL_STATEMENT_SWITCH

#include "Simbol.h"
#include "SimbolStatement.h"
#include "SimbolContSwitch.h"

class SimbolSwitchStatement : public SimbolStatement {
private:
public: 
    SimbolSwitchStatement();
    ~SimbolSwitchStatement();

    void make(Driver *driver, SimbolContSwitch cont);
};

#endif