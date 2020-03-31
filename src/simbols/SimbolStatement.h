#ifndef _H_SIMBOL_STATEMENT
#define _H_SIMBOL_STATEMENT

#include "Simbol.h"
#include "ControlInstruccions.h"
#include "SimbolExpressio.h"
#include "SimbolVarDecl.h"
#include "SimbolAssignacio.h"

class SimbolWhileStatement;
class SimbolIfStatement;
class SimbolSwitchStatement;
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

protected:
    std::list<Instruction *> seg;
    Label label;

public:
    SimbolStatement();
    ~SimbolStatement();

    void make(Driver *driver, SimbolVarDecl varDecl);
    void make(Driver *driver, SimbolAssignacio exp);
    void make(Driver *driver, SimbolSubProgramCall call);
    void make(Driver *driver, SimbolWhileStatement whileStmt);
    void make(Driver *driver, SimbolIfStatement ifStmt);
    void make(Driver *driver, SimbolSwitchStatement ifStmt);
    void make(Driver *driver, SimbolForStatement forStmt);
    void make(Driver *driver, SimbolExpressio exp);
    void make(Driver *driver, SimbolStatement::Tipus tipus);

    std::list<Instruction * > getSeg();
};

#endif