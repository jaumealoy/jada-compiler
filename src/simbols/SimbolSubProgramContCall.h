#ifndef _H_SIMBOL_SUBPROGRAM_CONT_CALL
#define _H_SIMBOL_SUBPROGRAM_CONT_CALL

#include "../taulasimbols/TaulaSimbols.h"
#include "SimbolReferencia.h"
#include "SimbolExpressio.h"
#include "SimbolMarcador.h"

class SimbolSubProgramContCall : public SimbolReferencia {
public:
	// estructura que permet guardar el final de l'expressió
	// i la pròpia expressió per facilitar el moviment d'instruccions
	struct ParametreReal {
		SimbolExpressio exp;
		SimbolMarcador m;
	};

private:
    TaulaSimbols::Iterator it;

	// llista dels valors dels paràmetres
	std::list<struct ParametreReal> params;

	// inici de les expressions
	SimbolMarcador inici;

public:
    SimbolSubProgramContCall();
    ~SimbolSubProgramContCall();

    void make(Driver *driver, std::string id, SimbolExpressio exp, SimbolMarcador m2, SimbolMarcador inici);
    void make(Driver *driver, SimbolSubProgramContCall cont, SimbolExpressio exp, SimbolMarcador m2);

    TaulaSimbols::Iterator getParametres();
	std::list<struct ParametreReal> getCallParams();
	SimbolMarcador getInici();
};

#endif