#ifndef _H_SIMBOL_PROCCAP
#define _H_SIMBOL_PROCCAP


#include "Simbol.h"
#include "SimbolProcContCap.h"
#include <string>

class SimbolProcCap : Simbol {
private:
    // nom de la funció
    std::string nom;

public:
    SimbolProcCap();
    ~SimbolProcCap();

    void make(Driver *driver, std::string nom);
    void make(Driver *driver, SimbolProcContCap cap);

    std::string getNomProcedure();
};

#endif