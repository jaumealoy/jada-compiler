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


protected:
    std::string id;
    std::string tipus;
    TipusSubjacentBasic tsb;

    SimbolReferencia::ModeMVP mode;

public:
    SimbolReferencia();
    ~SimbolReferencia();

    void make(Driver *driver, std::string nom);

    // Per marcar com una referència errònia
    bool isNull();
    void makeNull();

    // obtenir tipus i nom
    std::string getId();
    std::string getTipus();
    TipusSubjacentBasic getTSB();
    SimbolReferencia::ModeMVP getMode();
};

#endif