#ifndef _H_SIMBOL_MARCADOR
#define _H_SIMBOL_MARCADOR

#include "Simbol.h"
#include "../code/Label.h"

class SimbolMarcador : public Simbol {
private:
	Label et;
public:
	SimbolMarcador();
	~SimbolMarcador();
	
	void make(Driver *driver, int tipus);

	Label getLabel();
	
};


#endif