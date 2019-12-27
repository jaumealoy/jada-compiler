#ifndef _H_SIMBOL_CONTSWITCH
#define _H_SIMBOL_CONTSWITCH

#include "Simbol.h"
#include "SimbolStatement.h"
#include "SimbolExpressio.h"
#include <vector>
#include "SimbolBloc.h"

class SimbolContSwitch : public SimbolStatement {
private:
    bool teDefault;
    std::vector<int> valors;
    std::string tipus;
    TipusSubjacentBasic tsb;
public: 
    SimbolContSwitch();
    ~SimbolContSwitch();

    void make(Driver *driver, SimbolExpressio exp, SimbolBloc bloc);
    void make(Driver *driver, SimbolExpressio exp1, SimbolExpressio exp2, SimbolBloc bloc);
    void make(Driver *driver, SimbolContSwitch cont, SimbolBloc bloc);
    void make(Driver *driver, SimbolContSwitch cont, SimbolExpressio exp, SimbolBloc bloc);
};

#endif