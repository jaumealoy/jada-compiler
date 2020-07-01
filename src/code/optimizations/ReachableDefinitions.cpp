#include "ReachableDefinitions.h"
#include "../instructions/ArithmeticInstruction.h"
#include "../instructions/AssignmentInstruction.h"
#include "../instructions/PutParamInstruction.h"
#include <cassert>
#include <iostream>


ReachableDefinitions::ReachableDefinitions(SubProgram *programa) 
{
	this->program = programa;

	// identificar totes les definicions, que són instruccions
	// aritmètiques i d'assignació
	std::list<Instruction *> elements;
	Instruction *aux = program->getFirstInstruction();
	while(aux != nullptr && aux != program->getLastInstruction()->getNext()){
		switch(aux->getType()){
			case Instruction::Type::ARITHMETIC:
			case Instruction::Type::ASSIGNMENT:
				elements.push_back(aux);
				break;

			default:
				break;
		}

		aux = aux->getNext();
	}

	this->domini = std::make_shared<Domain<Instruction>>(elements);
	this->dominiInstruccions = elements;

	this->calculateInOut();
}

ReachableDefinitions::~ReachableDefinitions()
{
	
}

/**	
 * Actualitza el valor dels conjunts de guanys i eliminacions 
 * una vegada s'ha processat la instrucció actual
 */
void ReachableDefinitions::calculateGK(struct ReachableDefinitions::GK &gk, Instruction *actual){
	// en cas de tenir una instrucció del tipus [a = b] o [a = b op c]
	// les definicions eliminades són totes aquelles que tenen com a destí
	// la variable de destí "a", també deixen d'estar al conjunt de guanys
	// la definició creada és la definició [a = b] o [a = b op c]

	assert(actual != nullptr);

	switch(actual->getType()){
		case Instruction::Type::ARITHMETIC:
		case Instruction::Type::ASSIGNMENT:
		{
			Variable *desti = nullptr;
			if(actual->getType() == Instruction::Type::ARITHMETIC){
				desti = ((ArithmeticInstruction *) actual)->getDesti();
			}else{ // és d'assignació
				desti = ((AssignmentInstruction *) actual)->getDesti();
			}

			Instruction *aux = this->program->getFirstInstruction();
			while(aux != nullptr && aux != this->program->getLastInstruction()){
				if(aux->getType() == Instruction::Type::ARITHMETIC){
					ArithmeticInstruction *aInst = (ArithmeticInstruction *) aux;
					if(aInst->getDesti() == desti){
						gk.kills.put(aInst);
						gk.gains.remove(aInst);
					}
				}else if(aux->getType() == Instruction::Type::ASSIGNMENT){
					AssignmentInstruction *aInst = (AssignmentInstruction *) aux;
					if(aInst->getDesti() == desti){
						gk.kills.put(aInst);
						gk.gains.remove(aInst);
					}
				}

				aux = aux->getNext();
			}

			gk.gains.put(actual);
			break;
		}

		default:
			break;
	}
}

/**
 * Calcula el conjunt G i K per un bloc bàsic
 */
struct ReachableDefinitions::GK ReachableDefinitions::calculateGK(BasicBlock *actual)
{
	struct ReachableDefinitions::GK tmp;
	tmp.gains = Set<Instruction>(this->domini);
	tmp.gains.removeAll();
	tmp.kills = Set<Instruction>(this->domini);
	tmp.kills.removeAll();

	Instruction *aux = actual->getStart();
	Instruction *end = nullptr;
	if(actual->getEnd() != nullptr){
		end = actual->getEnd()->getNext();
	}

	while(aux != nullptr && aux != end){
		this->calculateGK(tmp, aux);
		aux = aux->getNext();
	}

	return tmp;
}

/**
 * Calcula i guarda els conjunts in/out per cada un dels blocs bàsics
 */
void ReachableDefinitions::calculateInOut(){
	// reiniciar el mapping
	this->inOut.clear();

	// inicialment tots els conjunts tenen com bloc de sortida
	// el conjunt de generats en el bloc
	BasicBlock *aux = this->program->getEntryBlock()->getNext();
	while(aux != nullptr && aux != this->program->getExitBlock()){
		struct ReachableDefinitions::GK tmp = this->calculateGK(aux);
		tmp.kills = tmp.gains;
		tmp.gains.removeAll();
		this->inOut.emplace(aux, tmp);
		aux = aux->getNext();
	}
	
	// afegir tots els successors del bloc d'entrada
	std::list<BasicBlock *> pendents;
	BasicBlock *tmpBlock = this->program->getEntryBlock()->getNext();
	while(tmpBlock != nullptr && tmpBlock != this->program->getExitBlock()){
		pendents.push_back(tmpBlock);
		tmpBlock = tmpBlock->getNext();
	}
	
	/*std::list<BasicBlock *> &successors = this->program->getEntryBlock()->getSuccessors();
	std::list<BasicBlock *>::iterator it = successors.begin();
	while(it != successors.end()){
		pendents.push_back(*it);
		it++;
	}*/

	while(pendents.size() > 0){
		BasicBlock *actual = pendents.front();
		assert(actual != nullptr);
		pendents.pop_front();

		// calcular l'in d'aquest bloc, que és la unió de l'out de
		// tots els seus predecessors
		Set<Instruction> in(this->domini);
		in.removeAll();

		std::list<BasicBlock *> &predecessors = actual->getPredecessors();
		std::list<BasicBlock *>::iterator it = predecessors.begin();
		while(it != predecessors.end()){
			// obtenir el conjunt d'out del bloc
			auto outPredecessor = this->inOut.find(*it);
			if(outPredecessor != this->inOut.end()){
				// kills és l'out del bloc
				in.add(outPredecessor->second.kills);
			}
			it++;
		}

		// calcular el nou out
		struct ReachableDefinitions::GK gkActual = this->calculateGK(actual);
		Set<Instruction> tmpOut = in;
		tmpOut.difference(gkActual.kills);
		tmpOut.add(gkActual.gains);

		// el conjunt out anterior és
		auto inOutActual = this->inOut.find(actual);
		if(inOutActual != this->inOut.end()){
			inOutActual->second.gains = in;

			if(inOutActual->second.kills != tmpOut){
				inOutActual->second.kills = tmpOut;

				// afegir tots els successors a pendents
				std::list<BasicBlock *> &successors = actual->getSuccessors();
				std::list<BasicBlock *>::iterator it = successors.begin();
				while(it != successors.end()){
					pendents.push_back(*it);
					it++;
				}
			}
		}
	}
}

/**
 * Calcula les definicions accessibles després de processar la instrucció
 */
void ReachableDefinitions::calculateRD(struct ReachableDefinitions::GK &rd, Instruction *inst){
	// el conjunt rd.gains són les definicions accessibles
	struct ReachableDefinitions::GK tmp;

}


/**
 * Calcula el conjunt de definicions que poden donar valor a la variable x
 * en una determinada instrucció
 * Això és les definicions accessibles que de la forma x = a [op b].
 */
Set<Instruction> ReachableDefinitions::useDefinitionChain(Instruction *inst, Variable *x){
	// partir de l'in del bloc per calcular les definicions accessibles a la 
	// instrucció inst
	BasicBlock *block = inst->getBasicBlock();
	struct ReachableDefinitions::GK rd;

	auto inOutBlock = this->inOut.find(block);
	rd = inOutBlock->second;

	Instruction *aux = block->getStart();
	if(aux != inst){
		while(aux != nullptr && aux != inst){
			this->calculateGK(rd, aux);
			aux = aux->getNext();
		}
	}

	Set<Instruction> ud = rd.gains;
	Set<Instruction>::iterator it = ud.begin();
	Instruction *instA = inst;
	while(it < ud.end()){
		Instruction *inst = *it;
		if(inst->getType() == Instruction::Type::ARITHMETIC){
			if(((ArithmeticInstruction *) inst)->getDesti() != x){
				ud.remove(inst);
			}
		}else if(inst->getType() == Instruction::Type::ASSIGNMENT){
			if(((AssignmentInstruction *) inst)->getDesti() != x){
				ud.remove(inst);
			}
		}

		it++;
	}

	return ud;
}