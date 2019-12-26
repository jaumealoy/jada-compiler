#ifndef _H_SIMBOLPROGRAMA
#define _H_SIMBOLPROGRAMA

#include "Simbol.h"
#include "SimbolDeclList.h"

#include <iostream>

class SimbolPrograma : public Simbol {
private:
    // determina si el programa té un programa principal o no
    bool teMain;

public:
    SimbolPrograma();
    ~SimbolPrograma();

    bool getTeMain();
    void setTeMain(bool teMain);

    void make(Driver *driver, SimbolDeclList declList);

    void toDotFile(Driver *driver);
};

#endif