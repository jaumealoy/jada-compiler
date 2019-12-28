#ifndef _H_SIMBOL_TIPUS
#define _H_SIMBOL_TIPUS

#include "Simbol.h"
#include "SimbolTipusArray.h"

class SimbolTipus : public Simbol {
private:
    std::string tipus;
public:
    SimbolTipus();
    ~SimbolTipus();

    void make(Driver *driver, std::string tipus);
    void make(Driver *driver, SimbolTipusArray array);

    std::string getTipus();
    operator std::string() const;
};

#endif