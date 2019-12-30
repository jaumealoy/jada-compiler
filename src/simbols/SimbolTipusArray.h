#ifndef _H_SIMBOL_TIPUS_ARRAY
#define _H_SIMBOL_TIPUS_ARRAY

#include "Simbol.h"
#include "SimbolReferencia.h"
#include "SimbolExpressio.h"
#include "../taulasimbols/TaulaSimbols.h"

#include <vector>
#include <string>

class SimbolTipusArray : public SimbolReferencia {
private:
    // Per referències
    TaulaSimbols::Iterator it;

    // Per definicions
    std::vector<int> dimensions;
    std::string tipusBasic;

    bool esReferencia;

public:
    SimbolTipusArray();

    ~SimbolTipusArray();

    void make(Driver *driver, SimbolTipusArray array);
    void make(Driver *driver, std::string id, SimbolExpressio exp);
    void make(Driver *driver, SimbolTipusArray contArray, SimbolExpressio exp);

    bool isReferencia();

    // Per referències

    // Per definicions
    std::string toString();
    std::string getTipusUnitari();

};

#endif