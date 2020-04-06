#include "AssemblyInstruction.h"

AssemblyInstruction::AssemblyInstruction(std::string code)
	: Instruction(Instruction::Type::ASSEMBLY)
{
	this->code = code;
}

AssemblyInstruction::~AssemblyInstruction() {}

/**
 * Escriu el codi assemblador així com s'ha passat per paràmetre
 */
void AssemblyInstruction::generateAssembly(CodeGeneration *code) {
	code->output << this->code;
}