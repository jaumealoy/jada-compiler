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
#include "ReturnInstruction.h"
#include "AssemblyInstruction.h"
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
void Instruction::generateAssembly(CodeGeneration *code){
	std::string tmp;

	switch (this->opcode) {
		case Type::SKIP:
			((SkipInstruction *) this)->generateAssembly(code);
			break;

		case Type::GOTO:
			((GoToInstruction *) this)->generateAssembly(code);
			break;

		case Type::CONDJUMP:
			((CondJumpInstruction *) this)->generateAssembly(code);
			break;

		case Type::ASSIGNMENT:
			((AssignmentInstruction *) this)->generateAssembly(code);
			break;

		case Type::PREAMBLE:
			((PreAmbleInstruction *) this)->generateAssembly(code);
			break;

		case Type::PUTPARAM:
			((PutParamInstruction *) this)->generateAssembly(code);
			break;

		case Type::CALL:
			((CallInstruction *) this)->generateAssembly(code);
			break;

		case Type::RETURN:
			((ReturnInstruction *) this)->generateAssembly(code);
			break;

		case Type::ASSEMBLY:
			((AssemblyInstruction *) this)->generateAssembly(code);

		default:
			tmp = "undefined instruction (" + std::to_string(this->opcode) + ")";
	}
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
