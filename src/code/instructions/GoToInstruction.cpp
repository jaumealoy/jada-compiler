#include "GoToInstruction.h"
#include "SkipInstruction.h"
#include "../CodeGeneration.h"

GoToInstruction::GoToInstruction(Label *label) : Instruction(Instruction::Type::GOTO) {
	this->label = label;
}

GoToInstruction::~GoToInstruction(){}

/**
 * Indica quina és l'etiqueta del salt i la marca com utilitzada
 */
void GoToInstruction::setLabel(Label *l){
	this->label = l;

	if(this->label != nullptr){
		this->label->markUsage();
	}
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
 * - Un salt incondicional que va a una etiqueta que té com a primera
 * instrucció un altre salt incondicional, pot anar directament a l'etiqueta
 * del segon salt incondicional
 * - Tot el codi entre un salt condicional i la següent etiqueta és inaccessible
 * - Un salt a la següent línia es pot eliminar
 */
#include <cassert>
bool GoToInstruction::optimize(CodeGeneration *code){
	Label *old = this->label;

	if(!this->isAddedAtOptimization()){
		this->label = code->getTargetLabel(old);
	}

	std::cout << "Fi target" << std::endl;

	bool canvis = old != this->label;

	if((Instruction *) this->label->getTargetInstruction() == this->getNext()){
		// és un salt a la següent instrucció
		// es pot eliminar
		code->remove(this);
		return true;
	}

	Instruction *next = this->getNext();
	Instruction *originalNext = this->getNext();
	while(next != nullptr && (next->getType() != Instruction::Type::SKIP || !((SkipInstruction *) next)->getLabel()->isUsed())){
		if(next->getType() == Instruction::Type::SKIP && ((SkipInstruction *) next)->isLoopStart()){
			break;
		}
		
		Instruction *tmp = next->getNext();
		code->remove(next);
		next = tmp;
	}

	canvis = canvis || originalNext != this->getNext();
	
	return canvis;
}