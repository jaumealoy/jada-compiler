#ifndef _H_SIMBOL_SUBPROGRAM_CONT_CALL
#define _H_SIMBOL_SUBPROGRAM_CONT_CALL

#include "../taulasimbols/TaulaSimbols.h"
#include "SimbolReferencia.h"
#include "SimbolExpressio.h"

class SimbolSubProgramContCall : public SimbolReferencia {
private:
    TaulaSimbols::Iterator it;

	// llista dels valors dels paràmetres
	std::list<SimbolExpressio> params;

public:
    SimbolSubProgramContCall();
    ~SimbolSubProgramContCall();

    void make(Driver *driver, std::string id, SimbolExpressio exp);
    void make(Driver *driver, SimbolSubProgramContCall cont, SimbolExpressio exp);

    TaulaSimbols::Iterator getParametres();
	std::list<SimbolExpressio> getCallParams();
};

#endif