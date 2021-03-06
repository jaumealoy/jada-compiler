#ifndef _H_SIMBOL_PROCCONTCAP
#define _H_SIMBOL_PROCCONTCAP

#include "Simbol.h"
#include "SimbolTipus.h"
#include "SimbolArgType.h"
#include <string>

class SimbolProcContCap : public Simbol {
private:
    // Nom de la funció
    std::string nomProcedure;

    // Nom i tipus del paràmetre formal (si n'hi ha)
    std::string nomArgument;
    std::string nomTipus;

public:
    SimbolProcContCap();
    ~SimbolProcContCap();

    std::string getNomProcedure();

    std::string getNomArgument();
    std::string getTipusArgument();

    void make(Driver *driver, std::string nomFuncio, SimbolArgType constant, SimbolTipus tipus, std::string nomParametre);
    void make(Driver *driver, SimbolProcContCap cap, SimbolArgType constant, SimbolTipus tipus, std::string nomParametre);
};

#endif