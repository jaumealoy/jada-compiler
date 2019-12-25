#ifndef _H_SIMBOL_REFERENCIA
#define _H_SIMBOL_REFERENCIA

#include "Simbol.h"
#include "../taulasimbols/TipusSubjacentBasic.h"
#include <string>

class SimbolReferencia : public Simbol {
public:
    enum ModeMVP {
        CONST,
        VAR,
        CRIDA_INCOMPLETA,
        CRIDA_COMPLETA
    };


private:
    std::string id;
    std::string tipus;

    SimbolReferencia::ModeMVP mode;

public:
    SimbolReferencia();
    ~SimbolReferencia();

    void make(Driver *driver, std::string nom);

};

#endif