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
	for(int i = nodes.size() - 1; i >= 0; i--){
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

				if(tmp.jump->getEnd()->getType() == Instruction::Type::GOTO){
					this->loops.push_back(tmp);
				}

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

		assert(start != nullptr);


		// comprovar si està associada a cap altre bloc bàsic
		if(start->getPreHeaderInstruction() == nullptr){
			// s'ha de crear la precapçalera
			// aquesta és la nova etiqueta a la que s'ha de fer el salt
			Label *newLabel = code->addLabel();
			SkipInstruction *newSkip = (SkipInstruction *) code->addInstruction(new SkipInstruction(newLabel));
			newSkip->setPreHeaderInstruction(start);
			code->move(newSkip, newSkip, start);

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

			// és la primera vegada que s'optimitza aquest bucle
			// realitzar la inversió
			// per això, s'ha de determinar on acaba l'expressió i copiar-la
			// al final de bucle
			Instruction *endExpression = tmp.header->getStart();
			bool trobat = false;
			while(endExpression != nullptr && !trobat){
				if(endExpression->getType() == Instruction::Type::SKIP){
					// és un possible final d'expressió
					if(((SkipInstruction *) endExpression)->isLoopStart()){
						trobat = true;
						break;
					}
				}

				endExpression = endExpression->getNext();
			}

			// l'expressió es troba entre els blocs bàsics header i finalBlock
			Instruction *begin = newSkip->getNext();
			Instruction *end = endExpression->getPrevious();

			// moure l'expressió abans de la precapçalera (newSkip)
			code->move(begin, end, start->getPrevious());

			// copiar l'expressió al final del bucle, abans del salt incondicional
			// que és tmp.jump->getEnd();
			Instruction *beginCopy = Instruction::copy(begin);
			Instruction *lastCopy = beginCopy;

			code->addInstruction(beginCopy);
				
			if(begin != end){
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
			SkipInstruction *skipFinalBucle = nullptr;
			Label *finalBucleLabel = nullptr;
				
			// hi ha blocs després del bucle
			skipFinalBucle = (SkipInstruction *) tmp.jump->getEnd()->getNext();
			finalBucleLabel = skipFinalBucle->getLabel();

			std::map<Label *, Label *> etiquetes;
			std::map<Label *, std::list<Instruction *>> pendentsCanvi;

			aux = beginCopy;
			while(aux != nullptr && aux != lastCopy->getNext()){
				if(aux->getType() == Instruction::GOTO){
					GoToInstruction *gotoInst = (GoToInstruction *) aux;
					
					if(gotoInst->getTarget()->getTargetInstruction() == endExpression){
						gotoInst->setLabel(newSkip->getLabel());
					}else{
						auto canvi = etiquetes.find(gotoInst->getTarget());
						if(canvi == etiquetes.end()){
							auto pendentList = pendentsCanvi.find(gotoInst->getTarget());
							if(pendentList == pendentsCanvi.end()){
								std::list<Instruction *> tmpList;
								tmpList.push_back(gotoInst);
								pendentsCanvi.emplace(gotoInst->getTarget(), tmpList);
							}else{
								pendentList->second.push_back(gotoInst);
							}
						}else{
							gotoInst->setLabel(canvi->second);						
						}
					}
				}else if(aux->getType() == Instruction::CONDJUMP){
					CondJumpInstruction *condJump = (CondJumpInstruction *) aux;
					
					if(condJump->getTarget()->getTargetInstruction() == endExpression){
						condJump->setLabel(newSkip->getLabel());
					}else{
						auto canvi = etiquetes.find(condJump->getTarget());
						if(canvi == etiquetes.end()){
							auto pendentList = pendentsCanvi.find(condJump->getTarget());
							if(pendentList == pendentsCanvi.end()){
								std::list<Instruction *> tmpList;
								tmpList.push_back(condJump);
								pendentsCanvi.emplace(condJump->getTarget(), tmpList);
							}else{
								pendentList->second.push_back(condJump);
							}
						}else{
							condJump->setLabel(canvi->second);						
						}
					}

					
				}else if(aux->getType() == Instruction::SKIP){
					// crear una nova etiqueta
					SkipInstruction *skipInstruction = (SkipInstruction *) aux;
					
					Label *label = code->addLabel();
					etiquetes.emplace(skipInstruction->getLabel(), label);

					auto pendents = pendentsCanvi.find(skipInstruction->getLabel());
					if(pendents != pendentsCanvi.end()){
						std::list<Instruction *> &canvis = pendents->second;
						std::list<Instruction *>::iterator it = canvis.begin();
						while(it != canvis.end()){
							if((*it)->getType() == Instruction::Type::CONDJUMP){
								CondJumpInstruction *condJump = (CondJumpInstruction *) *it;
								condJump->setLabel(label);
							}else if((*it)->getType() == Instruction::Type::GOTO){
								GoToInstruction *gotoInst = (GoToInstruction *) *it;
								gotoInst->setLabel(label);
							}
							it++;
						}
					}

					label->setTargetInstruction(skipInstruction);
					skipInstruction->setLabel(label);
				}

				aux = aux->getNext();
			}
		}else{
			// obtenir la precapçalera ja existent de passades iteracions
			assert(start->getPreHeaderInstruction() != nullptr);
			tmp.preheader = start->getPreHeaderInstruction()->getBasicBlock();
		}

	}
}

LoopOptimization::~LoopOptimization()
{

}

bool LoopOptimization::optimize(CodeGeneration *code){
	bool canvisG = false;

	// detecció d'invariants per cada bucle
	// detectar les possibles instruccions invariants, és a dir, variables
	// que només reben una assignació dins el bucle

	for(int i = 0; i < this->loops.size(); i++){
		std::map<Variable *, struct Assignment> variables;
		std::map<Instruction *, int> invariant;

		std::list<BasicBlock *> blocsLoop = this->getBasicBlocksInLoop(this->loops[i]);
		std::list<BasicBlock *>::iterator it = blocsLoop.begin();

		while(it != blocsLoop.end()){
			Instruction *aux = (*it)->getStart();
			Instruction *end = (*it)->getEnd()->getNext();

			while(aux != nullptr && aux != end){
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

		blocsLoop = this->getBasicBlocksInLoop(this->loops[i]);

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

				while(aux != nullptr && aux != end){
					// comprovar que es tracta d'una assignació o operació aritmètica
					Variable *desti = nullptr;
					if(aux->getType() == Instruction::Type::ARITHMETIC){
						desti = ((ArithmeticInstruction *) aux)->getDesti();
					}else if(aux->getType() == Instruction::Type::ASSIGNMENT){
						desti = ((AssignmentInstruction *) aux)->getDesti();
					}

					if(desti != nullptr){
						auto variable = variables.find(desti);
						if(variable != variables.end() && variable->second.counter == 1){
							// comprovar que la instrucció no és una invariant
							auto inv = invariant.find(variable->second.inst);
							int original = inv->second;
							if(inv != invariant.end() && inv->second <= 0){
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

		// una vegada s'han detectat les invariants, aquestes s'han de moure a 
		// a la precapçalera
		// per conservar l'ordre de les invariants s'ha d'anar bloc per bloc
		it = blocsLoop.begin();
		while(it != blocsLoop.end()){
			Instruction *aux = (*it)->getStart();
			Instruction *end = (*it)->getEnd()->getNext();

			while(aux != nullptr && aux != end){
				auto mode = invariant.find(aux);
				if(mode != invariant.end() && mode->second > 0){
					// és una invariant, és possible que es pugui moure
					// és necessari garantir que el seu bloc bàsic domina 
					// a la sortida del bucle
					BasicBlock *invariantBlock = aux->getBasicBlock();

					if(this->loops[i].jump->getDominadors().contains(invariantBlock)){					
						code->move(
							aux, 
							aux,
							this->loops[i].header->getStart()->getPrevious()	
						);

						canvisG = true;
					}
				}

				aux = aux->getNext();
			}

			it++;
		}

	}

	canvisG = this->optimizeInductionVariables(code) | canvisG;

	return canvisG;
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

	// és possible que el header i el jump siguin el mateix bloc
	if(loop.jump != loop.header){
		list.push_back(loop.jump);
		visitats.emplace(loop.jump, true);

		// anar visitant els predecessors fins arribar a d
		pendents.push_back(loop.jump);
	}

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

	// evitar duplicar el codi entre l'argument esquerra i el dret
	// obtenir els operands de les instruccions
	bool* esInvariant[] = {&esquerraInvariant, &dretaInvariant};
	Variable *operands[] = {nullptr, nullptr};

	if(inst->getType() == Instruction::ASSIGNMENT){
		AssignmentInstruction *aInst = (AssignmentInstruction *) inst;
		if(aInst->getType() == AssignmentInstruction::Type::SIMPLE){
			// és possible que sigui una assignació d'una constant
			operands[0] = aInst->getOrigen();
			if(operands[0] == nullptr){
				// és d'una constant
				*esInvariant[0] = true;
			}

			// és una assignació simple, només té un operand
			*esInvariant[1] = true;
		}else{
			// consideram que no és una invariant
			return;
		}
	}else if(inst->getType() == Instruction::ARITHMETIC){
		ArithmeticInstruction *aInst = (ArithmeticInstruction *) inst;
		operands[0] = aInst->getFirstOperand();
		operands[1] = aInst->getSecondOperand();
	}

	for(int i = 0; i < 2; i++){
		if(!*esInvariant[i]){ 
			// l'operand no és invariant (de moment)
			Variable *operand = operands[i];

			// a) comprovar si es tracta d'una constant
			if(operand->isConstant(true)){
				*esInvariant[i] = true;
			}

			if(!*esInvariant[i]){
				// b) comprovar que totes les definicions accessibles són
				// de fora del bloc
				bool totsFora = true;

				this->definitions = ReachableDefinitions(this->programa);
				Set<Instruction> ud = this->definitions.useDefinitionChain(inst, operand);
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
					it++;
				}

				*esInvariant[i] = totsFora;

				if(!*esInvariant[i]){
					// c) comprovar si té única definició accessible i
					// és invariant
					Set<Instruction>::iterator it = ud.begin();
					Instruction *def = *it;
					it++;
					if(!(it < ud.end())){
						// només n'hi ha una
						auto mode = invariants.find(def);
						if(mode != invariants.end() && mode->second > 0){
							*esInvariant[i] = true;
						}
					}
				}
			}
		}
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
}

/**
 * Determina quines són les variables d'inducció i aplica les
 * optimitzacions possibles
 */
bool LoopOptimization::optimizeInductionVariables(CodeGeneration *code)
{
	bool canvisLoop = false;
	for(int i = 0; i < this->loops.size(); i++){
		struct Loop &currentLoop = this->loops[i];

		// 1. identificar les possibles variables d'inducció, que són
		// aquelles instruccions que reben només una assignació
		std::map<Variable *, struct InductionAux> f;

		std::list<BasicBlock *> blocs = this->getBasicBlocksInLoop(currentLoop);
		std::list<BasicBlock *>::iterator blocIt = blocs.begin();
		while(blocIt != blocs.end()){
			Instruction *aux = (*blocIt)->getStart();
			Instruction *end = (*blocIt)->getEnd()->getNext();

			while(aux != nullptr && aux != end){
				Variable *desti = nullptr;
				if(aux->getType() == Instruction::ASSIGNMENT){
					desti = ((AssignmentInstruction *) aux)->getDesti();
				}else if(aux->getType() == Instruction::ARITHMETIC){
					desti = ((ArithmeticInstruction *) aux)->getDesti();
				}

				if(desti != nullptr){
					auto v = f.find(desti);
					if(v == f.end()){
						// és la primera assignació
						struct InductionAux tmp;
						tmp.counter = 1;
						tmp.inst = aux;
						tmp.var = nullptr;
						
						if(aux->getType() == Instruction::Type::ARITHMETIC){
							tmp.var = ((ArithmeticInstruction *) aux)->getDesti();
						}else if(aux->getType() == Instruction::Type::ASSIGNMENT){
							tmp.var = ((AssignmentInstruction *) aux)->getDesti();
						}

						f.emplace(desti, tmp);
					}else{
						// s'ha fet més d'una assignació
						v->second.counter++;
					}
				}

				aux = aux->getNext();
			}
			blocIt++;
		}

		std::map<Variable *, struct InductionVariable> vind;
		
		std::map<Variable *, struct InductionAux>::iterator tmpIt = f.begin();
		while(tmpIt != f.end()){
			if(tmpIt->second.counter == 1){
				// és una possible variable d'inducció
				// comprovar si és una variable d'inducció simple
				if(tmpIt->second.inst->getType() == Instruction::Type::ARITHMETIC){
					ArithmeticInstruction *aInst = (ArithmeticInstruction *) tmpIt->second.inst;
					// comprovar que és de la forma x = x +/- c
					switch(aInst->getOperator()){
						case ArithmeticInstruction::Type::ADDITION:
						case ArithmeticInstruction::Type::SUBTRACTION:
						{
							if(aInst->getFirstOperand() == aInst->getDesti() && aInst->getSecondOperand()->isConstant()){
								// x = x +/- c
								struct InductionVariable tmp;
								tmp.var = aInst->getDesti();
								tmp.factor = 1;
								tmp.basica = true;
								tmp.constant = *(int *) aInst->getSecondOperand()->getValor()->get();
								tmp.inst = aInst;
								
								if(aInst->getOperator() == ArithmeticInstruction::Type::SUBTRACTION){
									tmp.constant *= -1;
								}

								vind.emplace(aInst->getDesti(), tmp);
							}else if(aInst->getSecondOperand() == aInst->getDesti() && aInst->getFirstOperand()->isConstant()){
								// x = c +/- x
								struct InductionVariable tmp;
								tmp.var = aInst->getDesti();
								tmp.factor = 1;
								tmp.constant = *(int *) aInst->getFirstOperand()->getValor()->get();
								tmp.basica = true;
								tmp.inst = aInst;

								aInst->markAtOptimization();
								
								if(aInst->getOperator() == ArithmeticInstruction::Type::SUBTRACTION){
									tmp.factor = -1;
								}

								vind.emplace(aInst->getDesti(), tmp);
							}
							
							break;
						}

						default: 
							// no és del tipus d'una variable d'inducció bàsica
							break;
					}
				}
			}
			tmpIt++;
		}

		bool canvis = true;
		while(canvis){
			canvis = false;
			
			tmpIt = f.begin();
			while(tmpIt != f.end()){
				if(tmpIt->second.counter == 1){
					auto varInd = vind.find(tmpIt->second.var);
					if(varInd == vind.end()){
						// no és una variable d'inducció
						// comprovar que és de la forma valida
						if(tmpIt->second.inst->getType() == Instruction::Type::ARITHMETIC && !tmpIt->second.inst->isAddedAtOptimization()){
							ArithmeticInstruction *aInst = (ArithmeticInstruction *) tmpIt->second.inst;

							// quina és l'altre variable d'inducció (si existeix)
							Variable *v = nullptr;
							long k;
							if(!aInst->getFirstOperand()->isConstant() && aInst->getSecondOperand()->isConstant()){
								// és de la forma x = a +/-/* k
								v = aInst->getFirstOperand();
								k = *(int *) aInst->getSecondOperand()->getValor()->get();
							}else if(aInst->getFirstOperand()->isConstant() && !aInst->getSecondOperand()->isConstant()){
								// és de la forma x = k +/-/* a
								v = aInst->getSecondOperand();
								k = *(int *) aInst->getFirstOperand()->getValor()->get();
							}

							// comprovar que v és una variable d'inducció
							auto varInd = vind.find(v);
							if(varInd != vind.end()){
								struct InductionVariable varBasica = varInd->second;
								struct InductionVariable varOriginal = varInd->second;
								if(!varInd->second.basica){
									auto aux = vind.find(varInd->second.var);
									varBasica = aux->second;
								}

								// és una altra variable d'inducció
								// comprovar que és una suma/resta/multiplicació
								switch(aInst->getOperator()){
									case ArithmeticInstruction::Type::ADDITION:
									{
										// és de la forma x = x0 + k o x = k + x0
										struct InductionVariable tmp;
										tmp.var = varBasica.var;
										
										if(varOriginal.basica){
											tmp.factor = 1;
											tmp.constant = k;
										}else{
											tmp.factor = varOriginal.factor;
											tmp.constant = varOriginal.constant + k;
										}

										tmp.basica = false;
										tmp.inst = aInst;
										vind.emplace(tmpIt->second.var, tmp);
										canvis = true;
										break;
									}

									case ArithmeticInstruction::Type::SUBTRACTION:
									{
										// és de la forma x = x0 - k o x = k - x0
										struct InductionVariable tmp;
										tmp.var = varBasica.var;

										if(aInst->getFirstOperand() == varInd->first){
											// és de la forma x = x0 - k
											if(varOriginal.basica){
												tmp.factor = 1;
												tmp.constant = -k;
											}else{
												tmp.factor = varOriginal.factor;
												tmp.constant = varOriginal.constant - k;
											}
										}else{
											// és de la forma x = k - x0
											if(varOriginal.basica){
												tmp.factor = -1;
												tmp.constant = k;
											}else{
												tmp.factor = - varOriginal.factor;
												tmp.constant = k - varOriginal.constant;
											}
										}

										tmp.basica = false;
										tmp.inst = aInst;
										vind.emplace(tmpIt->second.var, tmp);
										canvis = true;
										break;
									}
									case ArithmeticInstruction::Type::MULTIPLICATION:
									{
										// és de la forma x = x0 * k o x = k * x0
										struct InductionVariable tmp;
										tmp.var = varBasica.var;

										if(varOriginal.basica){
											tmp.factor = k * varBasica.factor;
											tmp.constant = 0;
										}else{
											tmp.factor = k * varOriginal.factor;
											tmp.constant = k * varOriginal.constant;
										}

										tmp.basica = false;
										tmp.inst = aInst;
										vind.emplace(tmpIt->second.var, tmp);

										canvis = true;
										break;
									}

									default:
										// els altres casos no defineixen variables d'inducció
										// derivades
										break;
								}
							}
						}
					}
				}

				tmpIt++;
			}
		}

		// una vegada s'han identificat les variables d'inducció s'ha de transformar el codi
		std::map<Variable *, struct InductionVariable>::iterator vindIt = vind.begin();
		while(vindIt != vind.end()){
			if(!vindIt->second.basica){
				struct InductionVariable &tmp = vindIt->second;

				// obtenir les dades de la variable d'inducció bàsica
				auto x0 = vind.find(tmp.var);

				// s'han de modificar les variables d'inducció derivades
				Variable *sy = code->addVariable(TipusSubjacentBasic::INT);
				
				int increment = vindIt->second.factor * x0->second.constant;
				ArithmeticInstruction::Type op1 = ArithmeticInstruction::Type::ADDITION;
				if(increment < 0){
					op1 = ArithmeticInstruction::Type::SUBTRACTION;
					increment = -increment;
				}

				Variable *tmpIncrement = code->addVariable(TipusSubjacentBasic::INT);

				// sy = sy + w
				ArithmeticInstruction *incrementInst = new ArithmeticInstruction(
					op1,
					sy,
					sy,
					tmpIncrement
				);

				// per evitar que es detecti com a variable d'inducció a la pròxima iteració
				incrementInst->markAtOptimization();

				// canviar la instrucció y = x0 +/-/* k per y = sy
				Instruction *newAssignment = code->addInstruction(new AssignmentInstruction(
					vindIt->first,
					sy
				));

				code->addInstruction(new AssignmentInstruction(
					TipusSubjacentBasic::INT,
					tmpIncrement,
					std::make_shared<ValueContainer>((char *) &increment, sizeof(int))
				));

				code->addInstruction(incrementInst);
				
				// moure les noves instruccions després de l'antiga instrucció
				code->move(newAssignment, incrementInst, vindIt->second.inst);

				// afegir al final de la precapçalera
				Variable *t1 = code->addVariable(TipusSubjacentBasic::INT);
				Variable *t2 = code->addVariable(TipusSubjacentBasic::INT);

				// t1 = x0 * factor
				Variable *factor = code->addVariable(TipusSubjacentBasic::INT);
				Instruction *first = code->addInstruction(new AssignmentInstruction(
					TipusSubjacentBasic::INT,
					factor,
					std::make_shared<ValueContainer>((char *) &vindIt->second.factor, sizeof(int))
				));

				ArithmeticInstruction *t1Init = new ArithmeticInstruction(
					ArithmeticInstruction::Type::MULTIPLICATION,
					t1,
					vindIt->second.var,
					factor
				);
				code->addInstruction(t1Init);

				// t2 = t1 + constant
				Variable *constant = code->addVariable(TipusSubjacentBasic::INT);

				long constantValor = vindIt->second.constant;
				ArithmeticInstruction::Type operacio = ArithmeticInstruction::Type::ADDITION;
				if(vindIt->second.constant < 0){
					operacio = ArithmeticInstruction::Type::SUBTRACTION;
					constantValor = -constantValor;
				}

				code->addInstruction(new AssignmentInstruction(
					TipusSubjacentBasic::INT,
					constant,
					std::make_shared<ValueContainer>((char *) &constantValor, sizeof(int))
				));
				
				ArithmeticInstruction *t2Init = new ArithmeticInstruction(
					operacio,
					t2,
					t1,
					constant
				);
				code->addInstruction(t2Init);

				// sy = t2
				Instruction *syInit = code->addInstruction(new AssignmentInstruction(
					sy,
					t2
				));

				// trobar el final de la precapçalera
				code->move(first, syInit, currentLoop.header->getStart()->getPrevious());

				// determinar si la variable d'inducció bàsica es troba per 
				// abans o després de la variable d'inducció derivada
				bool basicaDespres = false;
				if(vindIt->second.inst->getBasicBlock() == x0->second.inst->getBasicBlock()){
					// estan al mateix bloc bàsic
					// anar des de la derivada fins al final de bloc bàsic
					// si es troba, estarà després
					BasicBlock *derivadaBlock = vindIt->second.inst->getBasicBlock();
					Instruction *aux = vindIt->second.inst;
					Instruction *end = derivadaBlock->getEnd()->getNext();
					bool trobada = false;

					while(!trobada && aux != nullptr && aux != end){
						trobada = aux == x0->second.inst;
						aux = aux->getNext();
					}

					basicaDespres = trobada;
				}else{
					// recòrrer els blocs successors de la variable d'inducció
					// derivada. 
					BasicBlock *derivadaBlock = vindIt->second.inst->getBasicBlock();
					std::list<BasicBlock *> pendents;
					std::map<BasicBlock *, bool> visitats;

					assert(vindIt->second.inst != nullptr);
					assert(derivadaBlock != nullptr);

					pendents.push_back(derivadaBlock);

					bool trobat = false;
					while(!trobat && pendents.size() > 0){
						BasicBlock *block = pendents.front();
						pendents.pop_front();

						trobat = block == x0->second.inst->getBasicBlock();

						assert(block != nullptr);
						std::list<BasicBlock *> &successors = block->getSuccessors();
						std::list<BasicBlock *>::iterator successorIt = successors.begin();

						while(successorIt != successors.end()){
							// no s'ha d'arribar a la precapçalera, només interessen
							// els blocs que es troben per davall de la variable derivada
							if(*successorIt != currentLoop.header 
								&& visitats.find(*successorIt) == visitats.end()){
								visitats.emplace(*successorIt, true);
								pendents.push_back(*successorIt);
							}
							successorIt++;
						}
					}

					basicaDespres = trobat;
				} 

				if(!basicaDespres){
					Variable *auxConst = code->addVariable(TipusSubjacentBasic::INT);
					Instruction *aux1 = code->addInstruction(new AssignmentInstruction(
						TipusSubjacentBasic::INT,
						auxConst,
						std::make_shared<ValueContainer>((const char *) &increment, sizeof(int))						
					));



					Instruction *aux2 = code->addInstruction(new ArithmeticInstruction(
						increment > 0 ? ArithmeticInstruction::Type::ADDITION : ArithmeticInstruction::Type::ADDITION,
						sy,
						sy,
						auxConst
					));

					code->move(aux1, aux2, syInit);
				}

				// eliminar l'antiga instrucció
				code->remove(vindIt->second.inst);
				
				// indicar que s'han realitzat canvis
				canvisLoop = true;
			}

			vindIt++;
		}
	}

	return canvisLoop;
}