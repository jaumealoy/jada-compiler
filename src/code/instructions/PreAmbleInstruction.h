#ifndef _H_CODE_PREAMBLE_INSTRUCTION
#define _H_CODE_PREAMBLE_INSTRUCTION

#include "Instruction.h"
#include "../SubProgram.h"

/**
 * La instrucció preamble permet reservar l'espai necessari
 * pels paràmetres a la pila.
 * Pel fet que a la pila només es poden posar valors múltiples
 * de 8 bytes, s'ha optat per aprofitar al màxim l'espai
 */

class PreAmbleInstruction : public Instruction {
private:
	SubProgram *programa;

public:
	PreAmbleInstruction(SubProgram *);
	~PreAmbleInstruction();

	SubProgram *getPrograma();	

	std::string toString();
	std::string generateAssembly();
};

#endif