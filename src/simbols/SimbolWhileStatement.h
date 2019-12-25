#ifndef _H_SIMBOL_STATEMENT_WHILE
#define _H_SIMBOL_STATEMENT_WHILE

#include "Simbol.h"
#include "SimbolStatement.h"
#include "SimbolBloc.h"

class SimbolWhileStatement : public SimbolStatement {
private:
public: 
    SimbolWhileStatement();
    ~SimbolWhileStatement();

    // TODO: falta afegir un paràmetre de l'expressió booleana
    void make(Driver *driver, SimbolBloc bloc);
};

#endif