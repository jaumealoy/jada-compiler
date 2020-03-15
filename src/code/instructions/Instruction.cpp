#include "Instruction.h"
#include <fstream>

#include "GoToInstruction.h"
#include "SkipInstruction.h"
#include "CondJumpInstruction.h"
#include "ArithmeticInstruction.h"
#include "AssignmentInstruction.h"

Instruction::Instruction(){
	this->next = nullptr;
}

Instruction::Instruction(Instruction::Type opcode){
	this->opcode = opcode;
	this->next = nullptr;
}

Instruction::~Instruction(){}

void Instruction::setNext(Instruction *next){
	this->next = next;
}

Instruction * Instruction::getNext(){
	return this->next;
}

std::string Instruction::toString(){
	std::string tmp;
	switch (this->opcode){
		case Type::GOTO:
			tmp = ((GoToInstruction *) this)->toString();
			break;
		
		case Type::SKIP:
			tmp = ((SkipInstruction *) this)->toString();
			break;

		case CONDJUMP:
			tmp = ((CondJumpInstruction *) this)->toString();
			break;

		case ARITHMETIC:
			tmp = ((ArithmeticInstruction *) this)->toString();
			break;

		case ASSIGNMENT:
			tmp = ((AssignmentInstruction *) this)->toString();
			break;

		default:
			tmp = "undefined instruction";
	}

	return tmp;
}

Instruction::Type Instruction::getType(){
	return this->opcode;
}
