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
	std::string tmp;
	switch(this->type){
		case ArithmeticInstruction::Type::ADDITION:
			tmp = "+";
			break;
		
		case ArithmeticInstruction::Type::SUBTRACTION:
			tmp = "-";
			break;

		case ArithmeticInstruction::Type::MULTIPLICATION:
			tmp = "*";
			break;

		case ArithmeticInstruction::Type::DIVISION:
			tmp = "/";
			break;

		case ArithmeticInstruction::Type::MOD:
			tmp = "%";
			break;
	}

	return this->desti.getNom() + " = " + this->v1.getNom() + " " + tmp + " " + this->v2.getNom();
}