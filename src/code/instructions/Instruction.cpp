#include "Instruction.h"
#include <fstream>

#include "GoToInstruction.h"
#include "SkipInstruction.h"

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

		default:
			tmp = "undefined insturction";
	}

	return tmp;
}
