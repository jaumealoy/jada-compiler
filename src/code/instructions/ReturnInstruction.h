#ifndef _H_CODE_RETURN_INSTRUCTION
#define _H_CODE_RETURN_INSTRUCTION

#include "Instruction.h"
#include "../Variable.h"
#include "../SubProgram.h"

class ReturnInstruction : public Instruction {
private:
	// valor de retorn (si n'hi ha)
	Variable *var;

	// subprograma del qual es vol retornar
	SubProgram *programa;

public:
	ReturnInstruction(SubProgram *programa);
	ReturnInstruction(SubProgram *programa, Variable *var);
	~ReturnInstruction();

	SubProgram *getPrograma();
	
	std::string toString();
	void generateAssembly(CodeGeneration *);
};

#endif