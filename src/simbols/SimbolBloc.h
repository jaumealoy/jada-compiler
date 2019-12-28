#ifndef _H_BLOC
#define _H_BLOC

#include "Simbol.h"
#include "ControlInstruccions.h"
#include "SimbolStatementList.h"

class SimbolBloc : public Simbol, public ControlInstruccions {
private:
public:
    SimbolBloc();
    ~SimbolBloc();

    void make(Driver *driver, SimbolStatementList list);
};


#endif