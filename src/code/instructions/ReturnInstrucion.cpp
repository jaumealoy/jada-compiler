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
void ReturnInstruction::generateAssembly(CodeGeneration *code){
	// primer alliberar l'espai per les variables locals
	code->output << "add" << CodeGeneration::getSizeTag(true, 8) << "\t$";
	code->output << std::to_string(this->programa->getOcupacioVariables()) << ", %";
	code->output << CodeGeneration::getRegister(CodeGeneration::Register::SP, 8) << std::endl;

	// recuperar el base pointer
	/*tmp += "mov" + CodeGeneration::getSizeTag(true, 8) + "\t";
	tmp += "(%" + CodeGeneration::getRegister(CodeGeneration::Register::SP, 8) + "), %";
	tmp += CodeGeneration::getRegister(CodeGeneration::Register::BP, 8) + ")\n";*/
	code->output << "pop\t%" + CodeGeneration::getRegister(CodeGeneration::Register::BP, 8) << std::endl;
	
	// retornar al subprograma invocador
	code->output << "ret";

}