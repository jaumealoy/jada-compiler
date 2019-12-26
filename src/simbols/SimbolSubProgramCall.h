#ifndef _H_SIMBOL_SUBPROGRAM_CALL
#define _H_SIMBOL_SUBPROGRAM_CALL

#include "SimbolReferencia.h"

class SimbolSubProgramContCall;

class SimbolSubProgramCall : public SimbolReferencia {
private:
public: 
    SimbolSubProgramCall();
    ~SimbolSubProgramCall();

    void make(Driver *driver, std::string id);
    void make(Driver *driver, SimbolSubProgramContCall cont);
};

#endif