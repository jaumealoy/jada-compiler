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
 * Reservar espai per les variables locals i inicialitzar
 */
void PreAmbleInstruction::generateAssembly(CodeGeneration *code) {
	// guardar el base pointer anterior
	code->output << "push\t%" + CodeGeneration::getRegister(CodeGeneration::Register::BP, 8) + "\n";

	// i actualitzar el base pointer
	code->output << "mov" << CodeGeneration::getSizeTag(true, 8) << "\t%";
	code->output << CodeGeneration::getRegister(CodeGeneration::Register::SP, 8);
	code->output << ", %" << CodeGeneration::getRegister(CodeGeneration::Register::BP, 8) << std::endl;
	code->output << "add" << CodeGeneration::getSizeTag(true, 8) << "\t$8, %"; // per compensar el push
	code->output << CodeGeneration::getRegister(CodeGeneration::Register::BP, 8) << std::endl;
	
	// reservar espai per variables locals
	code->output << "sub" + CodeGeneration::getSizeTag(true, 8) << "\t$";
	code->output << std::to_string(this->programa->getOcupacioVariables()) << ", %";
	code->output << CodeGeneration::getRegister(CodeGeneration::Register::SP, 8);

	// TODO: inicialitzar punters arrays!
}