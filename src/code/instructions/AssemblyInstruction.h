#ifndef _H_CODE_ASSEMBLY_INSTRUCTION
#define _H_CODE_ASSEMBLY_INSTRCUTION

#include "Instruction.h"
#include "../CodeGeneration.h"

class AssemblyInstruction : public Instruction {
private:
	std::string code;

public:
	AssemblyInstruction(std::string code);
	~AssemblyInstruction();

	void generateAssembly(CodeGeneration *code);
};

#endif