#include "SkipInstruction.h"

SkipInstruction::SkipInstruction(Label label) : Instruction(Instruction::Type::SKIP){
	this->label = label;
}

SkipInstruction::~SkipInstruction(){}

/**
 * Representació en codi de 3 adreces
 */
std::string SkipInstruction::toString(){
	return this->label.toString() + ": skip";
}

/**
 * Traducció a codi assemblador
 * Indicar una etiqueta consisteix en posar l'etiqueta al codi
 */
std::string SkipInstruction::generateAssembly() {
	return this->label.toString() + ":";
}