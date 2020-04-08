#include "MemoryInstruction.h"

MemoryInstruction::MemoryInstruction(bool store, Variable *var, CodeGeneration::Register reg)
	: Instruction(Instruction::Type::MEMORY)
{
	this->store = store;
	this->var = var;
	this->reg = reg;
}

MemoryInstruction::~MemoryInstruction(){}

void MemoryInstruction::generateAssembly(CodeGeneration *code){
	if(this->store){
		code->store(this, this->reg, this->var);
	}else{
		code->load(this, this->var, this->reg);
	}
}