#ifndef _H_SIMBOL_TIPUS_ARRAY
#define _H_SIMBOL_TIPUS_ARRAY

#include "Simbol.h"
#include "SimbolReferencia.h"
#include "SimbolExpressio.h"
#include "../taulasimbols/TaulaSimbols.h"

#include <vector>
#include <string>

class SimbolTipusArray : public SimbolReferencia {
public:
	// Aquesta estructura ajudarà a determinar quin és el número d'element
	// que es vol consultar
	struct ArrayIndex {
		SimbolExpressio index;
		DescripcioDimensio *dimensio;
	};
	
private:
    // Per referències
    TaulaSimbols::Iterator it;

	std::vector<struct ArrayIndex> refIndex;
	bool accessConstant;

    // Per definicions
    std::vector<int> dimensions;
    std::string tipusBasic;

    bool esReferencia;

	// per controlar els accessos a punters (o definicions de punters)
	bool esPunter;
	int pointerCount;
	bool esCreacio; // indica si podria ser una creació de memòria dinàmica

public:
    SimbolTipusArray();

    ~SimbolTipusArray();

    void make(Driver *driver, SimbolTipusArray array);
	void make(Driver *driver, std::string id);
    void make(Driver *driver, std::string id, SimbolExpressio exp);
    void make(Driver *driver, SimbolTipusArray contArray, SimbolExpressio exp);
    void make(Driver *driver, SimbolTipusArray array, int tipus);

    bool isReferencia();

    // Per referències
	bool isAccessConstant();

    // Per definicions
    std::string toString();
    std::string toString(bool punter);
    std::string getTipusUnitari();

	// Per crear dinàmicament arrays
	bool isArrayCreation();
	std::vector<struct ArrayIndex> getArrayIndex();

};

#endif