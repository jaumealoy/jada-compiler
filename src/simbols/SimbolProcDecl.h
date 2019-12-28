#ifndef _H_SIMBOLPROCDECL
#define _H_SIMBOLPROCDECL

#include "Simbol.h"
#include "SimbolProcCap.h"
#include "SimbolBloc.h"

class SimbolProcDecl : public Simbol {
private:
public:
    SimbolProcDecl();
    ~SimbolProcDecl();

    void make(Driver *driver, SimbolProcCap cap, SimbolBloc bloc, std::string nom);
};

#endif