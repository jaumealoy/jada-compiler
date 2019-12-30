#ifndef _H_SIMBOLDECL
#define _H_SIMBOLDECL

#include "Simbol.h"
#include "SimbolFuncDecl.h"
#include "SimbolProcDecl.h"
#include "SimbolVarDecl.h"

class SimbolDecl : public Simbol {
private:
public:
    SimbolDecl() : Simbol("Declaració"){}

    void make(Driver *driver, Simbol simbol);
    //void make(Driver *driver, SimbolFuncDecl s);
    //void make(Driver *driver, SimbolVarDecl s);
    //void make(Driver *driver, SimbolProcDecl s);

};

#endif