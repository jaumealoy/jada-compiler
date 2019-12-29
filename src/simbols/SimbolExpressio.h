#ifndef _H_SIMBOL_EXPRESSIO
#define _H_SIMBOL_EXPRESSIO

#include "Simbol.h"
#include "SimbolReferencia.h"
#include "SimbolLiteral.h"
#include "../taulasimbols/TipusSubjacentBasic.h"
#include <string>

class SimbolArithmeticExpression;
class SimbolRelExpr;

class SimbolExpressio : public Simbol {
public: 
    enum Mode{
        VAR,
        CONST,
        RESULTAT,
        NUL
    };

protected:
    std::string tipus;
    TipusSubjacentBasic tsb;
    SimbolExpressio::Mode mode;

    int intValue;
    bool boolValue;
    char charValue;

public:
    SimbolExpressio();
    ~SimbolExpressio();

    void make(Driver *driver, SimbolExpressio exp, int tipus);
    void make(Driver *driver, SimbolExpressio a, SimbolExpressio b, int tipus);
    void make(Driver *driver, SimbolReferencia ref);
    void make(Driver *driver, SimbolLiteral literal);
    void make(Driver *driver, SimbolExpressio a, SimbolExpressio b, SimbolExpressio c);
    void make(Driver *driver, SimbolRelExpr exp);
    void make(Driver *driver, SimbolArithmeticExpression exp);

    // Per marcar com una referència errònia
    bool isNull();
    void makeNull();

    int getIntValue();
    bool getBoolValue();
    char getCharValue();

    std::string getTipus();
    TipusSubjacentBasic getTSB();
    SimbolExpressio::Mode getMode();

};

#endif