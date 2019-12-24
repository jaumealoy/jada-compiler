#ifndef _H_SIMBOL_STATEMENT
#define _H_SIMBOL_STATEMENT

#include "Simbol.h"
#include "ControlInstruccions.h"

class SimbolStatement : public Simbol, public ControlInstruccions {
public:
    enum Tipus {
        FOR,
        WHILE,
        RETURN,
        BREAK,
        IF,
        SWITCH
    };

private:
    SimbolStatement::Tipus tipus;

public:
    SimbolStatement();
    ~SimbolStatement();

    void make(Driver *driver, SimbolStatement::Tipus tipus);
};

#endif