#ifndef _H_SIMBOL_FUNCCAP
#define _H_SIMBOL_FUNCCAP

#include "Simbol.h"
#include "SimbolFuncContCap.h"
#include <string>

class SimbolFuncCap : Simbol {
private:
    // nom de la funció
    std::string nom;

public:
    SimbolFuncCap();
    ~SimbolFuncCap();

    void make(Driver *driver, std::string nom, std::string tipus);
    void make(Driver *driver, SimbolFuncContCap cap, std::string tipus);

    std::string getNomFuncio();
};

#endif