#ifndef _H_SIMBOLPROGRAMA
#define _H_SIMBOLPROGRAMA

#include "Simbol.h"
#include "SimbolDeclList.h"

#include <iostream>

class SimbolPrograma : public Simbol {
private:
public:
    SimbolPrograma();
    ~SimbolPrograma();

    void make(Driver *driver, SimbolDeclList declList);

    void toDotFile(Driver *driver);
};

#endif