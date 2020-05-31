#include "SkipInstruction.h"
#include "../CodeGeneration.h"

SkipInstruction::SkipInstruction(Label *label) 
	: Instruction(Instruction::Type::SKIP), preheader(nullptr), loopStart(false)
{
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

void SkipInstruction::setLabel(Label *label){
	this->label = label;
}

/**
 * Si és una etiqueta que no s'utilitza, es pot eliminar aquesta
 * instrucció
 */
bool SkipInstruction::optimize(CodeGeneration *code){
	if(!this->label->isUsed() && !this->isAddedAtOptimization() && !this->loopStart){
		code->remove(this);
		return true;
	}

	return false;
}

SkipInstruction *SkipInstruction::getPreHeaderInstruction(){
	return this->preheader;
}

void SkipInstruction::setPreHeaderInstruction(SkipInstruction *inst){
	this->preheader = inst;
}

bool SkipInstruction::isLoopStart(){
	return this->loopStart;
}

void SkipInstruction::setLoopStart(bool loopStart){
	this->loopStart = loopStart;
}