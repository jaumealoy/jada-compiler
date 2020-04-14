#ifndef _H_SIMBOL_MARCADOR
#define _H_SIMBOL_MARCADOR

#include "Simbol.h"
#include "../code/Label.h"
#include "ControlInstruccions.h"

class SimbolMarcador : public Simbol {
private:
	Label *et;
	std::vector<Instruction *> seg;
	Instruction *inst;

public:
	SimbolMarcador();
	~SimbolMarcador();
	
	void make(Driver *driver, int tipus);

	Label *getLabel();
	std::vector<Instruction * > getSeg();

	Instruction *getInstruction();
};


#endif