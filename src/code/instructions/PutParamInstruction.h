#ifndef _H_CODE_INSTRUCTION_PUTPARAM
#define _H_CODE_INSTRUCTION_PUTPARAM

#include "Instruction.h"
#include "../Variable.h"
#include "../SubProgram.h"

class PutParamInstruction : public Instruction {
private:
	// valor que es vol passar
	Variable *valor;

	// variable del paràmetre
	Variable *argument;

	// subprograma al qual es vol passar
	SubProgram *programa;
public:
	PutParamInstruction(Variable *var, Variable *arg, SubProgram *program);
	~PutParamInstruction();

	std::string toString();
	std::string generateAssembly();
};

#endif