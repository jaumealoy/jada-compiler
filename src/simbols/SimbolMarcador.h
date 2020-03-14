#ifndef _H_SIMBOL_MARCADOR
#define _H_SIMBOL_MARCADOR

#include "Simbol.h"

class SimbolMarcador : public Simbol {
private:
public:
	SimbolMarcador();
	~SimbolMarcador();
	
	void make(Driver *driver, int tipus);
};


#endif