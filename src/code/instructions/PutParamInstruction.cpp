#include "PutParamInstruction.h"

PutParamInstruction::PutParamInstruction(Variable *var, SubProgram *programa) 
	: Instruction(Instruction::Type::PUTPARAM) 
{
	this->variable = var;
	this->programa = programa;
}

PutParamInstruction::~PutParamInstruction() {}

std::string PutParamInstruction::toString(){
	return "put param " + this->variable->getNom();
}