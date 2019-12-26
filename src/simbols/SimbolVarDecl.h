#ifndef _H_SIMBOL_VARDECL
#define _H_SIMBOL_VARDECL

#include "Simbol.h"
#include "SimbolVarInit.h"

class SimbolVarDecl : public Simbol {
private:
    bool esConst;
    std::string tipus;
public:
    SimbolVarDecl();
    ~SimbolVarDecl();

    void make(Driver *driver, Simbol constant, std::string tipus, std::string id, SimbolVarInit init);
    void make(Driver *driver, SimbolVarDecl varDecl, std::string id, SimbolVarInit init);
};

#endif