#ifndef _H_CASEBLOC
#define _H_CASEBLOC

#include "Simbol.h"
#include "ControlInstruccions.h"
#include "SimbolLiteral.h"
#include "SimbolBloc.h"

class SimbolCaseBloc : public Simbol, public ControlInstruccions {
private:
    SimbolLiteral sl;
public:
    SimbolCaseBloc() : Simbol() {};
    ~SimbolCaseBloc() {};

    SimbolLiteral getLiteral();

    void make(Driver *driver, SimbolLiteral lit, SimbolBloc bloc, SimbolCaseBloc casebloc);
    void make(Driver *driver, SimbolBloc bloc);
};


#endif