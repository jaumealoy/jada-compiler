#ifndef _H_SIMBOL_EXPRESSIO
#define _H_SIMBOL_EXPRESSIO

#include "Simbol.h"
#include "SimbolReferencia.h"
#include "SimbolLiteral.h"
#include "../taulasimbols/TipusSubjacentBasic.h"
#include "../utils/ValueContainer.h"
#include <string>
#include <vector>
#include "../code/instructions/Instruction.h"

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

    std::vector<Instruction *> ecert;
    std::vector<Instruction *> efals;

    int intValue;
    bool boolValue;
    char charValue;

	// representar el valor de la constant de manera genèrica
	std::shared_ptr<ValueContainer> value;

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
	void make(Driver *driver, SimbolReferencia ref, int tipus);

    // Per marcar com una referència errònia
    bool isNull();
    void makeNull();

    int getIntValue();
    bool getBoolValue();
    char getCharValue();

    std::vector<Instruction *> getCert();
    std::vector<Instruction *> getFals();

	std::shared_ptr<ValueContainer> getValue();

    std::string getTipus();
    TipusSubjacentBasic getTSB();
    SimbolExpressio::Mode getMode();

};

#endif