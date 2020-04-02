#include "SubProgramInitInstruction.h"
#include "../CodeGeneration.h"

SubProgramInitInstruction::SubProgramInitInstruction(SubProgram *programa)
	: Instruction(Instruction::Type::PROGRAMINIT)
{
	this->program = programa;
}

SubProgramInitInstruction::~SubProgramInitInstruction() {}

std::string SubProgramInitInstruction::toString() {
	return "init " + this->program->getNom();
}

/**
 * Guarda el BP anterior, reserva i inicialitza les variables locals
 */
std::string SubProgramInitInstruction::generateAssembly() {
	std::string tmp;

	// guardar el base pointer anterior
	tmp = "push\t%" + CodeGeneration::getRegister(CodeGeneration::Register::BP, 8) + "\n";

	// i actualitzar el base pointer
	tmp += "mov" + CodeGeneration::getSizeTag(true, 8) + "\t%";
	tmp += CodeGeneration::getRegister(CodeGeneration::Register::SP, 8);
	tmp += ", %" + CodeGeneration::getRegister(CodeGeneration::Register::BP, 8) + "\n";
	tmp += "add" + CodeGeneration::getSizeTag(true, 8) + "\t$8, %"; // per compensar el push
	tmp += CodeGeneration::getRegister(CodeGeneration::Register::BP, 8) + "\n";
	
	// reservar espai per variables locals
	tmp += "sub" + CodeGeneration::getSizeTag(true, 8) + "\t$";
	tmp += std::to_string(this->program->getOcupacioVariables()) + ", %";
	tmp += CodeGeneration::getRegister(CodeGeneration::Register::SP, 8);

	// TODO: inicialitzar punters arrays!

	return tmp;
}