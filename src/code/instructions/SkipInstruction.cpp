#include "SkipInstruction.h"
#include "../CodeGeneration.h"

SkipInstruction::SkipInstruction(Label *label) : Instruction(Instruction::Type::SKIP){
	this->label = label;

	// indicar que l'etiqueta és a aquesta instrucció
	this->label->setTargetInstruction(this);
}

SkipInstruction::~SkipInstruction(){}

/**
 * Representació en codi de 3 adreces
 */
std::string SkipInstruction::toString(){
	return this->label->toString() + ": skip";
}

/**
 * Traducció a codi assemblador
 * Indicar una etiqueta consisteix en posar l'etiqueta al codi
 */
void SkipInstruction::generateAssembly(CodeGeneration *code) {
	code->output << this->label->toString() + ":";
}

Label *SkipInstruction::getLabel(){ return this->label; }

/**
 * Si és una etiqueta que no s'utilitza, es pot eliminar aquesta
 * instrucció
 */
bool SkipInstruction::optimize(CodeGeneration *code){
	if(!this->label->isUsed()){
		code->remove(this);
		return true;
	}

	return false;
}