#ifndef _H_SIMBOL_EXPRESSIO
#define _H_SIMBOL_EXPRESSIO

#include "Simbol.h"
#include "SimbolLiteral.h"
#include "../taulasimbols/TipusSubjacentBasic.h"
#include <string>

class SimbolExpressio : public Simbol {
public: 
    enum Mode{
        VAR,
        CONST,
        RESULTAT
    };

private:
    std::string tipus;
    TipusSubjacentBasic tsb;
    SimbolExpressio::Mode mode;


public:
    SimbolExpressio();
    ~SimbolExpressio();

    void make(Driver *driver, SimbolLiteral literal);

    std::string getTipus();
    TipusSubjacentBasic getTSB();
    SimbolExpressio::Mode getMode();
};

#endif