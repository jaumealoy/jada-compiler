#ifndef _H_SIMBOL_TIPUS_ARRAY
#define _H_SIMBOL_TIPUS_ARRAY

#include "Simbol.h"

#include <vector>
#include <string>

class SimbolTipusArray : public Simbol {
private:
    std::vector<int> dimensions;
    std::string tipusBasic;

public:
    SimbolTipusArray();
    ~SimbolTipusArray();

    void make(int dimensio);

    void make(std::string tipusBasic);

    void toDotFile();

    std::string toString();
};

#endif