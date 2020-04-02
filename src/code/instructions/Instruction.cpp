#include "Instruction.h"
#include <fstream>

#include "GoToInstruction.h"
#include "SkipInstruction.h"
#include "CondJumpInstruction.h"
#include "ArithmeticInstruction.h"
#include "AssignmentInstruction.h"
#include "CallInstruction.h"
#include "PreAmbleInstruction.h"
#include "PutParamInstruction.h"
#include "SubProgramInitInstruction.h"
#include "ReturnInstruction.h"
#include "../CodeGeneration.h"

Instruction::Instruction(){
	this->next = nullptr;
	this->prev = nullptr;
}

Instruction::Instruction(Instruction::Type opcode){
	this->opcode = opcode;
	this->next = nullptr;
	this->prev = nullptr;
}

Instruction::~Instruction(){}

void Instruction::setNext(Instruction *next){
	this->next = next;
}

Instruction * Instruction::getNext(){
	return this->next;
}

void Instruction::setPrevious(Instruction *previous){
	this->prev = previous;
}

Instruction * Instruction::getPrevious(){
	return this->prev;
}

/**
 * Per representar en codi de 3 adreces
 * Invocar la funció de representació de cada tipus d'instrucció
 */
std::string Instruction::toString(){
	std::string tmp;
	switch (this->opcode){
		case Type::GOTO:
			tmp = ((GoToInstruction *) this)->toString();
			break;
		
		case Type::SKIP:
			tmp = ((SkipInstruction *) this)->toString();
			break;

		case CONDJUMP:
			tmp = ((CondJumpInstruction *) this)->toString();
			break;

		case ARITHMETIC:
			tmp = ((ArithmeticInstruction *) this)->toString();
			break;

		case ASSIGNMENT:
			tmp = ((AssignmentInstruction *) this)->toString();
			break;

		case CALL:
			tmp = ((CallInstruction *) this)->toString();
			break;

		case PUTPARAM:
			tmp = ((PutParamInstruction *) this)->toString();
			break;

		case PREAMBLE:
			tmp = ((PreAmbleInstruction *) this)->toString();
			break;

		case PROGRAMINIT:
			tmp = ((SubProgramInitInstruction *) this)->toString();
			break;

		case RETURN:
			tmp = ((ReturnInstruction *) this)->toString();
			break;

		default:
			tmp = "undefined instruction (" + std::to_string(this->opcode) + ")";
	}

	return tmp;
}

/**
 * Genera el codi assemblador de cada instrucció
 */
std::string Instruction::generateAssembly(){
	std::string tmp;

	switch (this->opcode) {
		case Type::SKIP:
			tmp = ((SkipInstruction *) this)->generateAssembly();
			break;

		case Type::GOTO:
			tmp = ((GoToInstruction *) this)->generateAssembly();
			break;

		case Type::ASSIGNMENT:
			tmp = ((AssignmentInstruction *) this)->generateAssembly();
			break;

		case Type::PREAMBLE:
			tmp = ((PreAmbleInstruction *) this)->generateAssembly();
			break;

		case Type::PUTPARAM:
			tmp = ((PutParamInstruction *) this)->generateAssembly();
			break;

		case Type::CALL:
			tmp = ((CallInstruction *) this)->generateAssembly();
			break;

		case Type::PROGRAMINIT:
			tmp = ((SubProgramInitInstruction *) this)->generateAssembly();
			break;

		case Type::RETURN:
			tmp = ((ReturnInstruction *) this)->generateAssembly();
			break;

		default:
			tmp = "undefined instruction (" + std::to_string(this->opcode) + ")";
	}

	return tmp;
}

/**
 * Especifica des de quin subprograma s'està cridant aquesta funció
 * Això permetrà generar el codi adequat per accedir a variables locals
 * o globals
 */
void Instruction::setInvokingSubProgram(SubProgram *program) {
	this->invokingProgram = program;
}

SubProgram *Instruction::getInvokingSubProgram(){
	return this->invokingProgram;
}

/**
 * Retorna la representació adequada de la variable en funció
 * de la profunditat del programa
 */
std::string Instruction::getAssemblyVariable(Variable *var){
	std::string tmp;

	if (var->getSubPrograma()->getNivellProfunditat() == 0) {
		// és una variable global definida al .bss o .data
		tmp = var->getAssemblyTag();	
	} else {
		// per construcció de JADA és impossible que es doni un altre cas
		// perquè no es permet la declaració de subprogrames dins subprogrames
		// this->invokingProgram->getNivellProfunditat() == var->getSubPrograma()->getNivellProfunditat()
		// les adreces són de 8 bytes
		tmp = std::to_string(var->getOffset()) + "(%" + CodeGeneration::getRegister(CodeGeneration::Register::BP, 8) + ")";
	}

	return tmp;
}

Instruction::Type Instruction::getType(){
	return this->opcode;
}
