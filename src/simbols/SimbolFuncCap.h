#ifndef _H_SIMBOL_FUNCCAP
#define _H_SIMBOL_FUNCCAP

#include "Simbol.h"
#include "SimbolTipus.h"
#include "SimbolFuncContCap.h"
#include <string>

class SimbolFuncCap : public Simbol {
private:
    // nom de la funció
    std::string nom;

public:
    SimbolFuncCap();
    ~SimbolFuncCap();

    void make(Driver *driver, std::string nom, SimbolTipus tipus);
    void make(Driver *driver, SimbolFuncContCap cap, SimbolTipus tipus);

    std::string getNomFuncio();
};

#endif