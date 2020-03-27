#ifndef _H_SIMBOL_ELSE_STATEMENT
#define _H_SIMBOL_ELSE_STATEMENT

#include "SimbolStatement.h"
#include "SimbolBloc.h"
#include "SimbolMarcador.h"

class SimbolElseIfStatement;

class SimbolElseStatement : public SimbolStatement {
private:

public:
    Label final;

    SimbolElseStatement();
    ~SimbolElseStatement();

    void make(Driver *driver, SimbolElseIfStatement elseif, SimbolMarcador marc, SimbolBloc bloc);
    //void make(Driver *driver, SimbolMarcador marc, SimbolBloc bloc);
    void make(Driver *driver, SimbolElseIfStatement elseif);
    //void make(Driver *driver);
};

#endif