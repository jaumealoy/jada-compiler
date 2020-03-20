#ifndef _H_SIMBOL_STATEMENT_LIST
#define _H_SIMBOL_STATEMENT_LIST

#include "Simbol.h"
#include "ControlInstruccions.h"
#include "SimbolStatement.h"
#include "SimbolMarcador.h"

class SimbolStatementList : public Simbol, public ControlInstruccions {
public:
    SimbolStatementList();
    ~SimbolStatementList();

    void make(Driver *driver, SimbolStatement stmt, SimbolMarcador m ,SimbolStatementList list);
    void make(Driver *driver);
};

#endif