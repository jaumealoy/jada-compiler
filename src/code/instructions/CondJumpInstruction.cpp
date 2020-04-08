#include "CondJumpInstruction.h"
#include "../CodeGeneration.h"

CondJumpInstruction::CondJumpInstruction(Operator op, Variable *e1, Variable *e2, Label l) 
	: Instruction(Instruction::Type::CONDJUMP) 
{
	// e1 op e2
	this->op = op;
	this->e1 = e1;
	this->e2 = e2;

	// etiqueta de salt si e1 op e2 és cert
	this->l = l;
}

CondJumpInstruction::~CondJumpInstruction(){}

std::string CondJumpInstruction::toString() {
	std::string opString;
	switch (this->op)
	{
		case EQ:
			opString = "==";
			break;
		case NEQ:
			opString = "!=";
			break;
		case LTE:
			opString = "<=";
			break;
		case LT:
			opString = "<";
			break;
		case GTE:
			opString = ">=";
			break;
		case GT:
			opString = ">";
			break;
		default:
			break;
	}

	return "if " + this->e1->getNom() + " " + opString + " " + this->e2->getNom() +" then goto " + this->l.toString();
}

void CondJumpInstruction::setLabel(Label l){
	this->l = l;
}

void CondJumpInstruction::generateAssembly(CodeGeneration *code){
	// e1 OP e2	
	// carregar variables als registres
	code->load(this, this->e1, CodeGeneration::Register::A);
	code->load(this, this->e2, CodeGeneration::Register::D);

	// je = jump if equal (=)
	// jne = jump if not equal (!=)
	// jg = jump if greater (<)
	// jge = jump if greater or equal (<=)
	// jl = jump if less (<)
	// jle = jump if less or equal (>=)
	std::string inst[] = {"je", "jne", "jg", "jge", "jl", "jle"};

	// cmp e1, e2 === cmp %rax, %rdx
	code->output << "cmp" << CodeGeneration::getSizeTag(true, this->e1->getOcupacio()) << "\t";
	code->output << "%" << CodeGeneration::getRegister(CodeGeneration::Register::A, this->e1->getOcupacio());
	code->output << ", %" << CodeGeneration::getRegister(CodeGeneration::Register::D, this->e2->getOcupacio()) << std::endl;

	code->output << inst[this->op] << "\t" << this->l.toString();
}