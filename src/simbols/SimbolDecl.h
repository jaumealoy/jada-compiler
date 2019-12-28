#ifndef _H_SIMBOLDECL
#define _H_SIMBOLDECL

#include "Simbol.h"
#include "SimbolFuncDecl.h"
#include "SimbolProcDecl.h"
#include "SimbolVarDecl.h"

class SimbolDecl : public Simbol {
private:
    // per controlar que la declaracio té un procediment main
    bool teMain;

public:
    SimbolDecl() : Simbol("Declaració"){
        this->teMain = false;
    }

    void setTeMain(bool main){
        this->teMain = main;
    }

    void make(Driver *driver, Simbol simbol);
    //void make(Driver *driver, SimbolFuncDecl s);
    //void make(Driver *driver, SimbolVarDecl s);
    //void make(Driver *driver, SimbolProcDecl s);

    bool getTeMain(){
        return this->teMain;
    }
};

#endif