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

protected:
    std::string tipus;
    TipusSubjacentBasic tsb;
    SimbolExpressio::Mode mode;


public:
    SimbolExpressio();
    ~SimbolExpressio();

    void make(Driver *driver, SimbolLiteral literal);

    bool isNull();
    void makeNull();

    std::string getTipus();
    TipusSubjacentBasic getTSB();
    SimbolExpressio::Mode getMode();

};

#endif