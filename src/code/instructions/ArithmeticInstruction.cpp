#include "ArithmeticInstruction.h"

ArithmeticInstruction::ArithmeticInstruction(ArithmeticInstruction::Type type, Variable desti, Variable v1, Variable v2) 
	: Instruction(Instruction::Type::ARITHMETIC) 
{
	this->type = type;
	this->desti = desti;
	this->v1 = v1;
	this->v2 = v2;
}

ArithmeticInstruction::~ArithmeticInstruction(){}

std::string ArithmeticInstruction::toString(){
	return this->desti.getNom() + " = " + this->v1.getNom() + " op " + this->v2.getNom();
}