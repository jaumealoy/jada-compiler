#ifndef _H_SIMBOL_REFERENCIA
#define _H_SIMBOL_REFERENCIA

#include "Simbol.h"
class SimbolTipusArray;
class SimbolSubProgramCall;
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

	// número de variable i desplaçament
	int r;
	int d;

public:
    SimbolReferencia();
    ~SimbolReferencia();

    void make(Driver *driver, std::string nom);
    void make(Driver *driver, SimbolTipusArray array);
    void make(Driver *driver, SimbolSubProgramCall call);

    // Per marcar com una referència errònia
    bool isNull();
    void makeNull();

    // obtenir tipus i nom
    std::string getId();
    std::string getTipus();
    TipusSubjacentBasic getTSB();
    SimbolReferencia::ModeMVP getMode();

	// desplaçament i número de variable
	int getOffset();
	int getReferencia();
};

#endif