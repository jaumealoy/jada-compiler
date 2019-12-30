#ifndef _H_SIMBOLDECLLIST
#define _H_SIMBOLDECLLIST

#include "Simbol.h"
#include "SimbolDecl.h"

class SimbolDeclList : public Simbol {
private:
public:
    SimbolDeclList();
    ~SimbolDeclList();

    void make(Driver *driver, SimbolDecl decl);
    void make(Driver *driver, SimbolDecl decl, SimbolDeclList list);
};

#endif