#ifndef _H_SIMBOL_STATEMENT_LIST
#define _H_SIMBOL_STATEMENT_LIST

#include "Simbol.h"
#include "ControlInstruccions.h"
#include "SimbolStatement.h"

class SimbolStatementList : public Simbol, public ControlInstruccions {
private:
public:
    SimbolStatementList();
    ~SimbolStatementList();

    void make(Driver *driver, SimbolStatement stmt, SimbolStatementList list);
};

#endif