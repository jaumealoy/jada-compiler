#ifndef _H_SIMBOL_LITERAL
#define _H_SIMBOL_LITERAL

#include "Simbol.h"
#include "../taulasimbols/TipusSubjacentBasic.h"
#include "../utils/ValueContainer.h"
#include <string>
#include <memory>

class SimbolLiteral : public Simbol {
protected:
    std::string tipus;
    TipusSubjacentBasic tsb;
	
	// TODO: eliminar
    /*int intValue;
    char charValue;*/

	std::shared_ptr<ValueContainer> value;

public:
    SimbolLiteral();
    ~SimbolLiteral();

    void make(Driver *driver, int valor);
    void make(Driver *driver, char valor);
    void make(Driver *driver, std::string valor);

    std::string getTipus();
    TipusSubjacentBasic getTSB();
    void setTSB(TipusSubjacentBasic newtsb);
    void setTipus(std::string newtipus);

    // obtenció de valors
    /*int getIntValue();
    char getCharValue();*/

	std::shared_ptr<ValueContainer> getValue();
};

#endif