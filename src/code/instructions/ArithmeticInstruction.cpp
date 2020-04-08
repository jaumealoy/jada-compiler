#include "ArithmeticInstruction.h"
#include "../CodeGeneration.h"

ArithmeticInstruction::ArithmeticInstruction(ArithmeticInstruction::Type type, Variable *desti, Variable *v1, Variable *v2) 
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

	return this->desti->getNom() + " = " + this->v1->getNom() + " " + tmp + " " + this->v2->getNom();
}

void ArithmeticInstruction::generateAssembly(CodeGeneration *code){
	switch (this->type) {
		case ArithmeticInstruction::Type::ADDITION:
		case ArithmeticInstruction::Type::SUBTRACTION: {
			// carregar els operands
			code->load(this, this->v1, CodeGeneration::Register::A);
			code->load(this, this->v2, CodeGeneration::Register::D);

			std::string opcode = "add";
			if(this->type == ArithmeticInstruction::Type::SUBTRACTION){
				opcode = "sub";
			}

			// realitzar l'operació, el resultat és al registre A
			code->output << opcode << CodeGeneration::getSizeTag(true, this->desti->getOcupacio());
			code->output << "\t%" << CodeGeneration::getRegister(CodeGeneration::Register::D, this->desti->getOcupacio());
			code->output << ", %" << CodeGeneration::getRegister(CodeGeneration::Register::A, this->desti->getOcupacio()) << std::endl;

			code->store(this, CodeGeneration::Register::A, this->desti);
			break;
		}

		case ArithmeticInstruction::Type::MULTIPLICATION:
			// clear dels registres
			code->output << "movq\t$0, %" << CodeGeneration::getRegister(CodeGeneration::Register::A, 8) << std::endl;
			code->output << "movq\t$0, %" << CodeGeneration::getRegister(CodeGeneration::Register::D, 8) << std::endl;

			// carregar els operands
			code->load(this, this->v1, CodeGeneration::Register::A);
			code->load(this, this->v2, CodeGeneration::Register::D);

			// realitzar l'operació, a = a * d
			code->output << "imul\t%" << CodeGeneration::getRegister(CodeGeneration::Register::D, 8) << ", ";
			code->output << "%" << CodeGeneration::getRegister(CodeGeneration::Register::A, 8) << std::endl;

			code->store(this, CodeGeneration::Register::A, this->desti);
			break;
	}

}