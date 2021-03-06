#include "ReturnInstruction.h"
#include "../CodeGeneration.h"

ReturnInstruction::ReturnInstruction(SubProgram *program)
	: Instruction(Instruction::Type::RETURN)
{
	this->programa = program;
	this->var = nullptr;
}

ReturnInstruction::ReturnInstruction(SubProgram *program, Variable *var)
	: Instruction(Instruction::Type::RETURN)
{
	this->programa = program;
	this->var = var;
}

ReturnInstruction::~ReturnInstruction(){}

SubProgram *ReturnInstruction::getPrograma(){
	return this->programa;
}

void ReturnInstruction::setPrograma(SubProgram *program){
	this->programa = program;
}

std::string ReturnInstruction::toString(){
	std::string tmp = "return";
	if(this->var != nullptr){
		tmp += " " + this->var->getNom();
	}
	return tmp;
}

/**
 * Alliberar espai ocupat per les variables locals, recuperar BP
 * i cridar a ret
 */
void ReturnInstruction::generateAssembly(CodeGeneration *code){
	// si és el return d'una funció actualitzar la variable de retorn
	if(this->var != nullptr){
		if(this->var->isConstant(true)){
			code->load(this->var->getValor(), CodeGeneration::Register::A, this->var->getTSB());
		}else{
			code->load(this, this->var, CodeGeneration::Register::A);
		}

		code->output << "mov" << CodeGeneration::getSizeTag(true, this->var->getOcupacio()) << "\t%";
		code->output << CodeGeneration::getRegister(CodeGeneration::Register::A, this->var->getOcupacio());
		code->output << ", " << std::to_string(this->programa->getOffsetRetorn()) << "(%rbp)" << std::endl;
	}

	// primer alliberar l'espai per les variables locals
	code->output << "add" << CodeGeneration::getSizeTag(true, 8) << "\t$";
	code->output << std::to_string(this->programa->getOcupacioVariables()) << ", %";
	code->output << CodeGeneration::getRegister(CodeGeneration::Register::SP, 8) << std::endl;

	// recuperar el base pointer
	code->output << "pop\t%" + CodeGeneration::getRegister(CodeGeneration::Register::BP, 8) << std::endl;
	
	// retornar al subprograma invocador
	code->output << "ret";

}

Variable *ReturnInstruction::getValor(){
	return this->var;
}