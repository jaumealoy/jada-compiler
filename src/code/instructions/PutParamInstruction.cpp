#include "PutParamInstruction.h"
#include "../CodeGeneration.h"

PutParamInstruction::PutParamInstruction(Variable *valor, Variable *argument, SubProgram *programa) 
	: Instruction(Instruction::Type::PUTPARAM) 
{
	this->valor = valor;
	this->argument = argument;
	this->programa = programa;
}

PutParamInstruction::~PutParamInstruction() {}

std::string PutParamInstruction::toString(){
	return "put param " + this->valor->getNom();
}

/**
 * L'operació consisteix en fer un empilat a la pila d'una
 * posició de memòria.
 * 
 * Les operacions a la pila - en el mode 64 bits - són només de 8 bytes.
 * Una opció és gastar 8 bytes per cada paràmetre o bé aproximar al múltiple
 * de 8 més pròxim.
 */
void PutParamInstruction::generateAssembly(CodeGeneration *code){
	std::string tmp;

	// carregar el valor al registre corresponent
	code->load(this, this->valor, CodeGeneration::Register::A);

	code->output << "mov" + CodeGeneration::getSizeTag(true, this->valor->getOcupacio());
	code->output << "\t%" + CodeGeneration::getRegister(CodeGeneration::Register::A, this->valor->getOcupacio()) + ", ";
	code->output << std::to_string(this->argument->getOffset() - 8) + "(%"; // - 8 perquè encara no s'ha inserit @return
	code->output << CodeGeneration::getRegister(CodeGeneration::Register::SP, 8) + ")";
}