#include "ReachableDefinitions.h"
#include "../instructions/ArithmeticInstruction.h"
#include "../instructions/AssignmentInstruction.h"

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

	switch(actual->getType()){
		case Instruction::Type::ARITHMETIC:
		case Instruction::Type::ASSIGNMENT:
		{
			Variable *desti;
			if(actual->getType() == Instruction::Type::ARITHMETIC){
				desti = ((ArithmeticInstruction *) actual)->getDesti();
			}else{ // és d'assignació
				desti = ((AssignmentInstruction *) actual)->getDesti();
			}

			Instruction *aux = this->program->getFirstInstruction();
			while(aux != nullptr && aux != this->program->getLastInstruction()){
				if(aux->getType() == Instruction::Type::ARITHMETIC){
					ArithmeticInstruction *aInst = (ArithmeticInstruction *) actual;
					if(aInst->getDesti() == desti){
						gk.kills.put(aInst);
						gk.gains.remove(aInst);
					}
				}else if(aux->getType() == Instruction::Type::ASSIGNMENT){
					AssignmentInstruction *aInst = (AssignmentInstruction *) actual;
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
struct ReachableDefinitions::GK ReachableDefinitions::calculateGK(BasicBlock *actual){
	struct ReachableDefinitions::GK tmp;
	tmp.gains = Set<Instruction>(this->domini);
	tmp.kills = Set<Instruction>(this->domini);

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
		tmp.kills.removeAll();
		this->inOut.emplace(aux, tmp);
	}
	
	// afegir tots els successors del bloc d'entrada
	std::list<BasicBlock *> pendents;
	std::list<BasicBlock *> &successors = this->program->getEntryBlock()->getSuccessors();
	std::list<BasicBlock *>::iterator it = successors.begin();
	while(it != successors.end()){
		pendents.push_back(*it);
		it++;
	}

	while(pendents.size() > 0){
		BasicBlock *actual = pendents.front();
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
		Set<Instruction> tmpOut = gkActual.gains;
		in.difference(gkActual.kills);
		tmpOut.add(in);

		// el conjunt out anterior és
		auto inOutActual = this->inOut.find(actual);
		if(inOutActual != this->inOut.end() && inOutActual->second.kills != tmpOut){
			inOutActual->second.kills = tmpOut;
			inOutActual->second.gains = in;

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

Set<Instruction> ReachableDefinitions::useDefinitionChain(Instruction *inst){
	
}
