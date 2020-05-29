#include "LoopOptimization.h"
#include "../CodeGeneration.h"
#include "../instructions/GoToInstruction.h"
#include "../instructions/CondJumpInstruction.h"
#include "../instructions/ArithmeticInstruction.h"
#include "../instructions/AssignmentInstruction.h"

#include <iostream>
#include <cassert>

LoopOptimization::LoopOptimization(CodeGeneration *code, SubProgram *programa)
	: definitions(programa)
{
	this->programa = programa;

	// ordenació topològica dels blocs, per determinar en quin ordre s'han
	// de processar els diferents bucles
	std::map<BasicBlock *, bool> visited;
	std::vector<BasicBlock *> nodes;
	otb(nodes, visited, this->programa->getEntryBlock());

	// els bucles més interns es troben abans que els bucles més externs
	for(int i = 0; i < nodes.size(); i++){
		// identificar els diferents bucles
		// això és identificar aquelles arestes x -> d tals que 
		// d domina a x
		std::list<BasicBlock *> &successors = nodes[i]->getSuccessors();
		std::list<BasicBlock *>::iterator it = successors.begin();
		while(it != successors.end()){
			if(nodes[i]->getDominadors().contains(*it)){
				// afegir el bucle
				struct Loop tmp;
				tmp.header = *it;
				tmp.preheader = nullptr;
				tmp.jump = nodes[i];
				this->loops.push_back(tmp);

				std::cout << "Detectat bucle entre block " << nodes[i]->mId << " i " << (*it)->mId << std::endl;
			}
			it++;
		}
	}

	// crear les precapçaleres o identificar-les si no existeixen
	for(int i = 0; i < this->loops.size(); i++){
		struct Loop &tmp = this->loops[i];

		// identificar l'etiqueta que comença al bloc bàsic del bucle
		// aquesta sempre serà la primera instrucció del bloc bàsic
		SkipInstruction *start = (SkipInstruction *) tmp.header->getStart();

		// comprovar si està associada a cap altre bloc bàsic
		if(start->getPreHeaderInstruction() == nullptr){
			// s'ha de crear la precapçalera
			// aquesta és la nova etiqueta a la que s'ha de fer el salt
			Label *newLabel = code->addLabel();
			SkipInstruction *newSkip = (SkipInstruction *) code->addInstruction(new SkipInstruction(newLabel));
			newSkip->setPreHeaderInstruction(start);
			code->move(newSkip, newSkip, start);

			std::cout << "Creant precapçalera: " << newLabel->getId() << std::endl;

			// indicar que aquestes instruccions no s'han d'eliminar
			newSkip->markAtOptimization();
			start->markAtOptimization();

			// i finalment modificar el salt del bloc del final
			// que ha d'anar a la nova etiqueta
			Instruction *aux = tmp.jump->getStart();
			while(aux != nullptr && aux != tmp.jump->getEnd()->getNext()){
				if(aux->getType() == Instruction::Type::GOTO){
					((GoToInstruction *) aux)->setLabel(newLabel);
				}else if(aux->getType() == Instruction::Type::CONDJUMP){
					((CondJumpInstruction *) aux)->setLabel(newLabel);
				}

				aux = aux->getNext();
			}

			std::cout << "Modificat bucle" << std::endl;

			// és la primera vegada que s'optimitza aquest bucle
			// realitzar la inversió

			// determinar quin és bloc que s'executa quan acaba el bucle
			// per això: s'agafen els successors del bloc de la capçalera
			// i es resta el conjunt de dominadors del bloc de tornada
			Set<BasicBlock> finalBucle = tmp.jump->getDominadors();
			finalBucle.removeAll();
			
			std::list<BasicBlock *> &successors = tmp.header->getSuccessors();
			std::list<BasicBlock *>::iterator myTmpIt = successors.begin();
			while(myTmpIt != successors.end()){
				finalBucle.put(*myTmpIt);
				myTmpIt++;
			}

			finalBucle.difference(tmp.jump->getDominadors());

			// és un conjunt amb un únic element
			Set<BasicBlock>::iterator finalIt = finalBucle.begin();
			BasicBlock *blocDespresBucle = *finalIt;

			// determinar on comença i acaba l'expressió
			// s'ha de duplicar condició
			// la condició acaba quan es troba el primer bloc que no conté el 
			// bloc després del bucle com a successor
			BasicBlock *actual = tmp.header;
			BasicBlock *finalBlock = actual;
			bool trobat = false;
			while(!trobat){
				trobat = true;

				bool trobatFinal = false;
				std::list<BasicBlock *> &successors = actual->getSuccessors();
				std::list<BasicBlock *>::iterator tmpIt = successors.begin();

				BasicBlock *next = nullptr;
				while(tmpIt != successors.end()){
					if(*tmpIt == blocDespresBucle){
						trobatFinal = true;
					}else{
						next = *tmpIt;
					}

					tmpIt++;
				}

				if(trobatFinal){
					// encara no s'ha detectat el final de la condició
					finalBlock = actual;
					trobat = false;
					actual = next;
				}
			}

			// l'expressió es troba entre els blocs bàsics header i finalBlock
			Instruction *begin = newSkip->getNext();
			Instruction *end = finalBlock->getEnd();

			std::cout << "L'expressió es troba entre " << tmp.header->mId << " i " << finalBlock->mId << std::endl;
			std::cout << "inici = " << begin->toString() << std::endl;
			std::cout << "final = " << finalBlock->getEnd()->toString() << std::endl;
			std::cout << "moure abans de  = " << start->toString() << std::endl;

			// moure l'expressió abans de la precapçalera (newSkip)
			code->move(begin, end, start->getPrevious());

			std::cout << "Copiant des de " << begin->toString() << " fins a " << begin->toString() << std::endl;

			// copiar l'expressió al final del bucle, abans del salt incondicional
			// que és tmp.jump->getEnd();
			Instruction *beginCopy = Instruction::copy(begin);
			Instruction *lastCopy = beginCopy;

			code->addInstruction(beginCopy);
			
			if(begin != end){
				std::cout << "Inici: " << begin->toString() << std::endl;
				std::cout << "Final: " << end->toString() << std::endl;

				aux = begin->getNext();
				while(aux != end->getNext()){
					lastCopy = Instruction::copy(aux);
					code->addInstruction(lastCopy);
					aux = aux->getNext();
				}
			}

			// moure la condició copiada abans del final del bucle
			code->move(
				beginCopy,
				lastCopy,
				tmp.jump->getEnd()->getPrevious()
			);

			// actualitzar les etiquetes dels salts
			// l'etiqueta final no s'ha d'actualitzar
			assert(blocDespresBucle->getStart()->getType() == Instruction::Type::SKIP);
			SkipInstruction *skipFinalBucle = (SkipInstruction *) blocDespresBucle->getStart();
			Label *finalBucleLabel = skipFinalBucle->getLabel();

			std::map<Label *, Label *> etiquetes;
			aux = beginCopy;
			while(aux != nullptr && aux != lastCopy->getNext()){
				if(aux->getType() == Instruction::GOTO){
					GoToInstruction *gotoInst = (GoToInstruction *) aux;
					if(gotoInst->getTarget() != finalBucleLabel){
						// comprovar que no s'ha assignat anteriorment
						auto et = etiquetes.find(gotoInst->getTarget());
						Label *label;
						if(et == etiquetes.end()){
							// s'ha de crear una nova etiqueta
							label = code->addLabel();
							etiquetes.emplace(gotoInst->getTarget(), label);
						}else{
							label = et->second;
						}

						gotoInst->setLabel(label);
					}
				}else if(aux->getType() == Instruction::CONDJUMP){
					CondJumpInstruction *condJump = (CondJumpInstruction *) aux;
					if(condJump->getTarget() != finalBucleLabel){
						// comprovar que no s'ha assignat anteriorment
						auto et = etiquetes.find(condJump->getTarget());
						Label *label;
						if(et == etiquetes.end()){
							// s'ha de crear una nova etiqueta
							label = code->addLabel();
							etiquetes.emplace(condJump->getTarget(), label);
						}else{
							label = et->second;
						}

						condJump->setLabel(label);
					}
				}else if(aux->getType() == Instruction::SKIP){
					// crear una nova etiqueta
					SkipInstruction *skipInstruction = (SkipInstruction *) aux;
					
					Label *label;
					auto et = etiquetes.find(skipInstruction->getLabel());
					if(et == etiquetes.end()){
						// no existeix l'etiqueta
						label = code->addLabel();
						etiquetes.emplace(skipInstruction->getLabel(), label);
					}else{
						// l'etiqueta ja s'ha creat anteriorment
						label = et->second;
					}

					skipInstruction->setLabel(label);
				}

				aux = aux->getNext();
			}
		}else{
			// obtenir la precapçalera ja existent de passades iteracions
			tmp.header = start->getPreHeaderInstruction()->getBasicBlock();
		}

	}
}

LoopOptimization::~LoopOptimization()
{

}

bool LoopOptimization::optimize(CodeGeneration *code){
	std::cout << "Optimització de bucles: inici" << std::endl;

	// detecció d'invariants per cada bucle
	// detectar les possibles instruccions invariants, és a dir, variables
	// que només reben una assignació dins el bucle

	std::map<Variable *, struct Assignment> variables;
	std::map<Instruction *, int> invariant;

	for(int i = 0; i < this->loops.size(); i++){
		std::list<BasicBlock *> blocsLoop = this->getBasicBlocksInLoop(this->loops[i]);
		std::list<BasicBlock *>::iterator it = blocsLoop.begin();

		std::cout << "Optimitzant bucles" << std::endl;


		while(it != blocsLoop.end()){
			Instruction *aux = (*it)->getStart();
			Instruction *end = (*it)->getEnd()->getNext();

			std::cout << "Optimitzant bucles: bloc" << std::endl;

			while(aux != end){
				Variable *desti = nullptr;
				if(aux->getType() == Instruction::Type::ARITHMETIC){
					ArithmeticInstruction *aInst = (ArithmeticInstruction *) aux;
					desti = aInst->getDesti();
				}else if(aux->getType() == Instruction::Type::ASSIGNMENT){
					AssignmentInstruction *aInst = (AssignmentInstruction *) aux;
					desti = aInst->getDesti();
				}

				// indicar que la instrucció no té cap operador invariant
				invariant.emplace(aux, 0);
				
				if(desti != nullptr){
					auto var = variables.find(desti);
					if(var != variables.end()){
						// s'ha trobat la variable, no és una assignació única
						var->second.counter++;
					}else{
						// no existeix la variable
						struct Assignment tmp;
						tmp.counter = 1;
						tmp.inst = aux;
						variables.emplace(desti, tmp);
					}
				}
			
				aux = aux->getNext();
			}		

			it++;
		}

		// s'han identificat totes les instruccions que poden ser invariants
		// analitzar cada potencial invariant
		bool canvis = true;
		while(canvis){
			canvis = false;

			// recòrrer totes les instruccions dels blocs bàsics
			it = blocsLoop.begin();
			while(it != blocsLoop.end()){
				Instruction *aux = (*it)->getStart();
				Instruction *end = (*it)->getEnd()->getNext();

				while(aux != end){
					// comprovar que es tracta d'una assignació o operació aritmètica
					Variable *desti = nullptr;
					if(aux->getType() == Instruction::Type::ARITHMETIC){
						desti = ((ArithmeticInstruction *) aux)->getDesti();
					}else if(aux->getType() == Instruction::Type::ASSIGNMENT){
						desti = ((AssignmentInstruction *) aux)->getDesti();
					}

					if(desti != nullptr){
						auto variable = variables.find(desti);
						if(variable != variables.end()){
							// comprovar que la instrucció no és una invariant
							auto inv = invariant.find(variable->second.inst);
							int original = inv->second;
							if(inv != invariant.end() && inv->second <= 0){
								std::cout << "analitzant inst bucle " << aux->toString() << std::endl;

								// analitzar si es tracta realment d'una invariant
								this->checkInvariant(aux, invariant, blocsLoop);

								// ha passat a ser una invariant?
								canvis = canvis || inv->second > 0;
							}
						}
					}

					aux = aux->getNext();
				}

				it++;
			}	
		}
	}

	// una vegada s'han detectat les invariants, aquestes s'han de moure a 
	// a la precapçalera
	std::map<Instruction *, int>::iterator invariantsIt = invariant.begin();
	while(invariantsIt != invariant.end()){
		if(invariantsIt->second > 0){
			// és una invariant, és possible que es pugui moure
			// comprovar que l'única 

		}
		invariantsIt++;
	}


	return false;
}

/**
 * Ordenació topològica dels blocs
 * És un recorregut sobre el graf: visita successors i afegeix node actual
 */
void LoopOptimization::otb(std::vector<BasicBlock *> &nodes, std::map<BasicBlock *, bool> &visitats, BasicBlock *actual)
{
	// comprovar si el node actual ja ha estat visitat
	auto nodeActual = visitats.find(actual);
	if(nodeActual != visitats.end()){
		// ja ha estat visitat
		return;
	}

	// es marca com a visitat i es visiten tots els successors
	visitats.emplace(actual, true);

	std::list<BasicBlock *> &successors = actual->getSuccessors();
	std::list<BasicBlock *>::iterator it = successors.begin();
	while(it != successors.end()){
		// visitar el node
		otb(nodes, visitats, *it);
		it++;
	}

	// afegir a la llista visitats
	std::cout << "OTB: visitant " << actual->mId << std::endl;
	nodes.push_back(actual);
}

/**
 * Calcula els blocs bàsics que formen part d'un bucle
 * L(x -> d)
 */
std::list<BasicBlock *> LoopOptimization::getBasicBlocksInLoop(struct Loop &loop){
	std::list<BasicBlock *> list;
	std::list<BasicBlock *> pendents;

	std::map<BasicBlock *, bool> visitats;

	// els blocs x i d ja formen part del bucle
	list.push_back(loop.header);
	visitats.emplace(loop.header, true);

	list.push_back(loop.jump);
	visitats.emplace(loop.jump, true);

	// anar visitant els predecessors fins arribar a d
	pendents.push_back(loop.jump);
	while(pendents.size() > 0){
		BasicBlock *actual = pendents.front();
		pendents.pop_front();

		std::list<BasicBlock *> &predecessors = actual->getPredecessors();
		std::list<BasicBlock *>::iterator it = predecessors.begin();
		while(it != predecessors.end()){
			auto trobat = visitats.find(*it);
			
			if(trobat == visitats.end()){
				// no s'ha visitat
				list.push_back(*it);
				pendents.push_back(*it);
				visitats.emplace(*it, true);
			}
			
			it++;
		}
	}

	return list;
}

#include <cassert>

/**
 * Comprova i actualitza la invariància d'una instrucció
 * @param {Instruction *} inst instrucció que s'ha d'analitzar
 * @param {map<Instruction *, int>} invariants mode d'invariant de les instruccions
 * @param {list<BasicBlock *>} blocs bàsics del bucle
 */
void LoopOptimization::checkInvariant(Instruction *inst, 
	std::map<Instruction *, int> &invariants, std::list<BasicBlock *> &blocs)
{
	auto invariant = invariants.find(inst);
	if(invariant == invariants.end()){
		// aquesta instrucció no té informació sobre la invariància
		return;
	}

	// determinar si els arguments són inicialment invariants
	bool esquerraInvariant = (invariant->second == 1) || (invariant->second == -1);
	bool dretaInvariant = (invariant->second == 1) || (invariant->second == -2);

	if(!esquerraInvariant){
		Variable *operand = nullptr;
		if(inst->getType() == Instruction::Type::ASSIGNMENT){
			operand = ((AssignmentInstruction *) inst)->getOrigen();

			// pot ser és una assignació d'una constant
			AssignmentInstruction *aInst = (AssignmentInstruction *) inst;
			if(aInst->getType() == AssignmentInstruction::Type::SIMPLE && operand == nullptr){
				esquerraInvariant = true;
			}
		}else if(inst->getType() == Instruction::Type::ARITHMETIC){
			operand = ((ArithmeticInstruction *) inst)->getFirstOperand();
		}

		// a) comprovar si es tracta d'una constant
		esquerraInvariant = esquerraInvariant || operand->isConstant();

		if(!esquerraInvariant){
			// b) comprovar que totes les definicions accessibles són
			// de fora del bloc
			bool totsFora = true;

			Set<Instruction> ud;
			Set<Instruction>::iterator it = ud.begin();

			while(totsFora && it < ud.end()){
				// comprovar si el bloc bàsic forma part o no del conjunt
				// de blocs bàsics del bucle
				bool trobat = false;
				std::list<BasicBlock *>::iterator bIt = blocs.begin();
				while(!trobat && bIt != blocs.end()){
					trobat = *bIt == (*it)->getBasicBlock();
					bIt++;
				}

				// si s'ha trobat, és perquè la definició és de dins el propi bucle
				totsFora = !trobat;
			}

			esquerraInvariant = totsFora;

			if(!esquerraInvariant){
				// c) comprovar si té única definició accessible i
				// és invariant
				Set<Instruction>::iterator it = ud.begin();
				Instruction *def = *it;
				it++;
				if(!(it < ud.end())){
					// només n'hi ha una
					auto mode = invariants.find(def);
					if(mode != invariants.end() && mode->second > 0){
						esquerraInvariant = true;
					}
				}
			}
		}
	}

	// si es tracta d'un assignació a = b, suposarem que no té operand dret
	// i per tant, dretaInvariant = true
	if(inst->getType() == Instruction::Type::ASSIGNMENT){
		if(((AssignmentInstruction *) inst)->getType() == AssignmentInstruction::Type::SIMPLE){
			dretaInvariant = true;
		}
	}

	if(!dretaInvariant){

	}

	// actualitzar el mapping d'invariants segons 
	if(esquerraInvariant && dretaInvariant){
		invariant->second = 1;
	}else if(!esquerraInvariant && dretaInvariant){
		invariant->second = -2;
	}else if(esquerraInvariant && !dretaInvariant){
		invariant->second = -1;
	}else if(!esquerraInvariant && !dretaInvariant){
		invariant->second = 0;
	}

	std::cout << "Instrucció " << inst->toString() << " té invariant " << invariant->second << std::endl;
}