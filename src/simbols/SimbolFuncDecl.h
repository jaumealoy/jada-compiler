#ifndef _H_SIMBOL_FUNCDECL
#define _H_SIMBOL_FUNCDECL

#include "Simbol.h"
#include "SimbolFuncCap.h"
#include "SimbolBloc.h"

class SimbolFuncDecl : public Simbol {
public:
    SimbolFuncDecl();
    ~SimbolFuncDecl();
    
    void make(Driver *driver, SimbolFuncCap cap, SimbolBloc bloc, std::string nom);
};

#endif