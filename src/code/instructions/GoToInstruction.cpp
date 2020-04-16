#include "GoToInstruction.h"
#include "../CodeGeneration.h"

GoToInstruction::GoToInstruction(Label *label) : Instruction(Instruction::Type::GOTO) {
	this->label = label;
}

GoToInstruction::~GoToInstruction(){}

void GoToInstruction::setLabel(Label *l){
	this->label = l;
}

Label *GoToInstruction::getTarget(){
	return this->label;
}

std::string GoToInstruction::toString(){
	return "goto e" + std::to_string(this->label->getId());
}

void GoToInstruction::generateAssembly(CodeGeneration *code){
	code->output << "jmp\te" << std::to_string(this->label->getId());
}

/**
 * Un salt incondicional que va a una etiqueta que té com a primera
 * instrucció un altre salt incondicional, pot anar directament a l'etiqueta
 * del segon salt incondicional
 */
bool GoToInstruction::optimize(CodeGeneration *code){
	Label *old = this->label;
	this->label = code->getTargetLabel(old);

	bool canvis = old != this->label;

	if((Instruction *) this->label->getTargetInstruction() == this->getNext()){
		// és un salt a la següent instrucció
		// es pot eliminar
		code->remove(this);
		return true;
	}

	return canvis;
}