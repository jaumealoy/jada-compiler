#ifndef _H_SIMBOLDECLLIST
#define _H_SIMBOLDECLLIST

#include "Simbol.h"
#include "SimbolDecl.h"

class SimbolDeclList : public Simbol {
private:
    // per controlar que la llista de declaracion té un procediment
    bool teMain;

public:
    SimbolDeclList();
    ~SimbolDeclList();

    void make(Driver *driver, SimbolDecl decl);
    void make(Driver *driver, SimbolDecl decl, SimbolDeclList list);

    void setTeMain(bool main){
        this->teMain = main;
    }

    bool getTeMain(){
        return this->teMain;
    }
};

#endif