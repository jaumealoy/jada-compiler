#ifndef _H_SIMBOL_FUNCCONTCAP
#define _H_SIMBOL_FUNCCONTCAP

#include "Simbol.h"
#include "SimbolTipus.h"
#include "SimbolArgType.h"
#include <string>

class SimbolFuncContCap : public Simbol {
private:
    // Nom de la funció
    std::string nomFuncio;

    // Nom i tipus del paràmetre formal (si n'hi ha)
    std::string nomArgument;
    std::string nomTipus;

public:
    SimbolFuncContCap();
    ~SimbolFuncContCap();

    std::string getNomFuncio();

    std::string getNomArgument();
    std::string getTipusArgument();

    void make(Driver *driver, std::string nomFuncio, SimbolArgType constant, SimbolTipus tipus, std::string nomParametre);
    void make(Driver *driver, SimbolFuncContCap cap, SimbolArgType constant, SimbolTipus tipus, std::string nomParametre);
};

#endif
