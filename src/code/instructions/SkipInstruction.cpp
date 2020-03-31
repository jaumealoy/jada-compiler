#include "SkipInstruction.h"

SkipInstruction::SkipInstruction(Label label) : Instruction(Instruction::Type::SKIP){
	this->label = label;
}

SkipInstruction::~SkipInstruction(){}

/**
 * Representació en codi de 3 adreces
 */
std::string SkipInstruction::toString(){
	return "e" + std::to_string(this->label.getId()) + ": skip";
}

/**
 * Traducció a codi assemblador
 * Indicar una etiqueta consisteix en posar l'etiqueta al codi
 */
std::string SkipInstruction::generateAssembly() {
	return "e" + std::to_string(this->label.getId()) + ":";
}