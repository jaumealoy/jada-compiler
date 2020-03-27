#ifndef _H_SIMBOL_ELSEIF_STATEMENT
#define _H_SIMBOL_ELSEIF_STATEMENT

#include "SimbolStatement.h"
#include "SimbolBloc.h"
#include "SimbolElseStatement.h"
#include "SimbolMarcador.h"

class SimbolElseIfStatement : public SimbolStatement {
private:

public:
    SimbolElseIfStatement();
    ~SimbolElseIfStatement();

    Label final;

    //void make(Driver *driver, SimbolExpressio exp, SimbolMarcador marc, SimbolBloc bloc, SimbolElseIfStatement elseIf);
    void make(Driver *driver, SimbolElseIfStatement elseif, SimbolMarcador einici, SimbolExpressio exp, SimbolMarcador ebloc, SimbolBloc bloc);
    void make(Driver *driver, SimbolExpressio exp, SimbolMarcador ebloc, SimbolBloc bloc);
    //void make(Driver *driver, SimbolElseStatement elseBloc);
};

#endif