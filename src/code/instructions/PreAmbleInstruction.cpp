#include "PreAmbleInstruction.h"
#include "../CodeGeneration.h"

PreAmbleInstruction::PreAmbleInstruction(SubProgram *program)
	: Instruction(Instruction::Type::PREAMBLE) 
{
	this->programa = program;
}

PreAmbleInstruction::~PreAmbleInstruction() {}

SubProgram * PreAmbleInstruction::getPrograma() {
	return this->programa;
}

std::string PreAmbleInstruction::toString(){
	return "preamble " + this->programa->getNom();
}

/**
 * S'ha de reservar espai a la pila pels paràmetres
 */
std::string PreAmbleInstruction::generateAssembly() {
	std::string tmp;

	tmp = "sub" + CodeGeneration::getSizeTag(true, 8);
	tmp += "\t$" + std::to_string(this->programa->getOcupacioParametres()) + ", %";
	tmp += CodeGeneration::getRegister(CodeGeneration::Register::SP, 8);

	return tmp;
}