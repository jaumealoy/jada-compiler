#include "MemoryInstruction.h"
#include "../CodeGeneration.h"

MemoryInstruction::MemoryInstruction(Variable *var, MemoryInstruction::Type type)
	: Instruction(Instruction::Type::MEMORY), var(var), tipus(type)
{

}

MemoryInstruction::~MemoryInstruction()
{

}

std::string MemoryInstruction::toString()
{
	switch(this->tipus){
		case MemoryInstruction::Type::INCREMENT:
			return "increment " + this->var->getNom();

		case MemoryInstruction::Type::DECREMENT:
			return "decrement " + this->var->getNom();
	}

	return "";
}

void MemoryInstruction::generateAssembly(CodeGeneration *code)
{
	switch(this->tipus){
		case MemoryInstruction::Type::INCREMENT:
		{
			code->load(this, this->var, CodeGeneration::Register::A);
			code->output << "push\t%" << CodeGeneration::getRegister(CodeGeneration::Register::A, this->var->getOcupacio()) << std::endl;
			code->output << "call\tjada_reference_add" << std::endl;
			code->output << "addq\t$" << this->var->getOcupacio() << ", %" << CodeGeneration::getRegister(CodeGeneration::Register::SP, 8) << std::endl; 
			break;
		}

		case MemoryInstruction::Type::DECREMENT:
		{
			code->load(this, this->var, CodeGeneration::Register::A);
			code->output << "push\t%" << CodeGeneration::getRegister(CodeGeneration::Register::A, this->var->getOcupacio()) << std::endl;
			code->output << "call\tjada_reference_decrement" << std::endl;
			code->output << "addq\t$" << this->var->getOcupacio() << ", %" << CodeGeneration::getRegister(CodeGeneration::Register::SP, 8) << std::endl; 
			break;
		}
	}
}

void MemoryInstruction::updateConstants(){
	this->var->addUseList(this);
}

MemoryInstruction::Type MemoryInstruction::getType(){
	return this->tipus;
}

Variable *MemoryInstruction::getVariable(){
	return this->var;
}