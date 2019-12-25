#ifndef _H_SIMBOL_LITERAL
#define _H_SIMBOL_LITERAL

#include "Simbol.h"
#include "../taulasimbols/TipusSubjacentBasic.h"
#include <string>

class SimbolLiteral : public Simbol {
private:
    std::string tipus;
    TipusSubjacentBasic tsb;

public:
    SimbolLiteral();
    ~SimbolLiteral();

    void make(Driver *driver, int valor);
    void make(Driver *driver, char valor);
    void make(Driver *driver, std::string valor);

    std::string getTipus();
    TipusSubjacentBasic getTSB();
};

#endif