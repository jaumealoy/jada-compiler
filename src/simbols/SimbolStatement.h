#ifndef _H_SIMBOL_STATEMENT
#define _H_SIMBOL_STATEMENT

#include "Simbol.h"
#include "ControlInstruccions.h"
#include "SimbolExpressio.h"

class SimbolWhileStatement;
class SimbolIfStatement;
class SimbolForStatement;

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

    void make(Driver *driver, SimbolWhileStatement whileStmt);
    void make(Driver *driver, SimbolIfStatement ifStmt);
    void make(Driver *driver, SimbolForStatement forStmt);
    void make(Driver *driver, SimbolExpressio exp);
    void make(Driver *driver, SimbolStatement::Tipus tipus);
};

#endif