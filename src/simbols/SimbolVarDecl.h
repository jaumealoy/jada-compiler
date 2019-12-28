#ifndef _H_SIMBOL_VARDECL
#define _H_SIMBOL_VARDECL

#include "Simbol.h"
#include "SimbolVarInit.h"

class SimbolVarDecl : public Simbol {
private:
    bool esConst;

    std::string tipus;
    TipusSubjacentBasic tsb;
    
public:
    SimbolVarDecl();
    ~SimbolVarDecl();

    void make(Driver *driver, std::string tipus, std::string id, SimbolVarInit init, bool constant);
    void make(Driver *driver, SimbolVarDecl varDecl, std::string id, SimbolVarInit init);
};

#endif