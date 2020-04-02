#include "ReturnInstruction.h"
#include "../CodeGeneration.h"

ReturnInstruction::ReturnInstruction(SubProgram *program)
	: Instruction(Instruction::Type::RETURN)
{
	this->programa = program;
}

ReturnInstruction::~ReturnInstruction(){}

SubProgram *ReturnInstruction::getPrograma(){
	return this->programa;
}

std::string ReturnInstruction::toString(){
	return "return";
}

/**
 * Alliberar espai ocupat per les variables locals, recuperar BP
 * i cridar a ret
 */
std::string ReturnInstruction::generateAssembly(){
	std::string tmp;

	// primer alliberar l'espai per les variables locals
	tmp += "add" + CodeGeneration::getSizeTag(true, 8) + "\t$";
	tmp += std::to_string(this->programa->getOcupacioVariables()) + ", %";
	tmp += CodeGeneration::getRegister(CodeGeneration::Register::SP, 8) + "\n";

	// recuperar el base pointer
	/*tmp += "mov" + CodeGeneration::getSizeTag(true, 8) + "\t";
	tmp += "(%" + CodeGeneration::getRegister(CodeGeneration::Register::SP, 8) + "), %";
	tmp += CodeGeneration::getRegister(CodeGeneration::Register::BP, 8) + ")\n";*/
	tmp += "pop\t%" + CodeGeneration::getRegister(CodeGeneration::Register::BP, 8) + "\n";
	
	// retornar al subprograma invocador
	tmp += "ret";

	return tmp;
}