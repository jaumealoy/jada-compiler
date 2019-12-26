#ifndef _H_SIMBOL_PROCCONTCAP
#define _H_SIMBOL_PROCCONTCAP

#include "Simbol.h"
#include <string>

class SimbolProcContCap : Simbol {
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

    void make(Driver *driver, std::string nomFuncio, std::string tipus, std::string nomParametre);
    void make(Driver *driver, SimbolProcContCap cap, std::string tipus, std::string nomParametre);
};

#endif