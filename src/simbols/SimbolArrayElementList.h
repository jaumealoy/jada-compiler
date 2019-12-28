#ifndef _H_SIMBOL_ARRAYELEMENT_LIST
#define _H_SIMBOL_ARRAYELEMENT_LIST

#include "Simbol.h"
#include "SimbolExpressio.h"
class SimbolArrayFinalList;
class SimbolArrayInitList;

class SimbolArrayElementList : public Simbol {
protected:
    // indica si tots els elements coincideixen
    bool match;

    // incluou altres dimensions
    std::vector<int> dimensions;

    // tots els elements trobat
    std::vector<SimbolExpressio> elements;

    // indica si és una llista d'elements finals
    bool elementsFinals;

    int numElementsActuals;

public:
    SimbolArrayElementList();
    ~SimbolArrayElementList();

    void make(Driver *driver);
    void make(Driver *driver, SimbolArrayFinalList list);
    void make(Driver *driver, SimbolArrayInitList list);

    bool isElementsFinals();

    bool coincideixen();
    std::vector<SimbolExpressio> getElements();
    std::vector<int> getDimensions();
    int getElementsActuals();
};

#endif