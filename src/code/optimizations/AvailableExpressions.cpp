#include "AvailableExpressions.h"
#include "../instructions/AssignmentInstruction.h"
#include "../CodeGeneration.h"
#include <cassert>
#include <iostream>

AvailableExpressions::AvailableExpressions(SubProgram *programa)
	: subprograma(programa)
{
	// identificar totes les expressions del subprograma
	std::list<struct Expression *> dominiElements;

	Instruction *actual = programa->getFirstInstruction();
	Instruction *end = programa->getLastInstruction();
	if(end != nullptr){
		end = end->getNext();
	}

	while(actual != end){
		if(actual->getType() == Instruction::Type::ARITHMETIC){
			// és una instrucicó d'assignació
			ArithmeticInstruction *tmp = (ArithmeticInstruction *) actual;
			std::string expressionId = tmp->getExpressionId();

			auto x = hashExpressions.find(expressionId);
			if(x == hashExpressions.end()){
				// no s'havia detectat aquesta expressió
				struct Expression *aux = new struct Expression;
				aux->hash = expressionId;
				hashExpressions.emplace(expressionId, aux);
				dominiElements.push_back(aux);

				// indicar que la primera instrucció que genera aquesta expressió 
				// és aquesta instrucció
				aux->first = actual;

				aux->exp = nullptr;
			}

			// afegir als dos operands les expressions
			tmp->getFirstOperand()->addExpression(expressionId);
			tmp->getSecondOperand()->addExpression(expressionId);
		}

		actual = actual->getNext();
	}

	// una vegada s'han identificat totes les expressions es pot crear el
	// domini i el conjunt d'expressions
	this->domini = std::make_shared<Domain<struct Expression>>(dominiElements);
	this->expressions = Set<struct Expression>(domini);
	this->expressions.putAll();

	// inicialment tots els blocs bàsics tenen out totes les expressions
	// excepte el primer
	struct AvailableExpressions::GK tmpStruct;
	tmpStruct.gains = Set<struct Expression>(domini); // in
	tmpStruct.kills = Set<struct Expression>(domini); // out

	BasicBlock *aux = programa->getEntryBlock();
	tmpStruct.kills.removeAll();
	this->inOut.emplace(aux, tmpStruct);
	aux = aux->getNext();

	tmpStruct.kills.putAll();
	while(aux != nullptr){
		this->inOut.emplace(aux, tmpStruct);
		aux = aux->getNext();
	}
	
	// calcular i guardar in-out de cada bloc
	this->calculateInOut();
}

AvailableExpressions::~AvailableExpressions()
{
	// eliminar la memòria reservada al constructor
	std::map<std::string, struct Expression *>::iterator it;
	it = this->hashExpressions.begin();
	while(it != this->hashExpressions.end()){
		delete it->second;
		it++;
	}
}

/**
 * Calcula el conjunts de guanys i eliminacions donat
 * un bloc bàsic
 */
struct AvailableExpressions::GK AvailableExpressions::calculateGK(BasicBlock *block)
{
	struct AvailableExpressions::GK tmp;
	tmp.gains = Set<struct AvailableExpressions::Expression>(this->domini);
	tmp.gains.removeAll();
	tmp.kills = Set<struct AvailableExpressions::Expression>(this->domini);
	tmp.kills.removeAll();
	
	if(block == subprograma->getExitBlock() || block == subprograma->getEntryBlock()){
		// és el bloc de sortida, no interesa
		return tmp;	
	}

	assert(block != nullptr);
	assert(block->getEnd() != nullptr);

	Instruction *actual = block->getStart();
	Instruction *end = block->getEnd()->getNext();

	while(actual != nullptr && actual != end){
		this->calculateGK(tmp, actual);
		actual = actual->getNext();
	}

	return tmp;
}

/**
 * Calcula el conjunt de guanys i eliminacions per una instrucció
 */
void AvailableExpressions::calculateGK(struct AvailableExpressions::GK &gk, Instruction * inst){
	if(inst->getType() == Instruction::Type::ARITHMETIC){
		// a = b op c
		// totes aquelles expressions amb argument "a" deixen d'estar disponibles
		// l'expressió b op c passa estar disponible 
		ArithmeticInstruction *aux = (ArithmeticInstruction *) inst;

		// primer afegir l'expressió
		auto tmpExp = this->hashExpressions.find(aux->getExpressionId());
		gk.gains.put(tmpExp->second); // ha d'existir necessàriament

		// després eliminar totes aquelles expressions que tenen
		// el destí com operand
		std::list<std::string> &tmpList = aux->getDesti()->getExpressionList();
		std::list<std::string>::iterator it = tmpList.begin();
		while(it != tmpList.end()){
			auto tmpExp = this->hashExpressions.find(*it);
			if(tmpExp != this->hashExpressions.end()){
				gk.gains.remove(tmpExp->second);
				gk.kills.put(tmpExp->second);
			}
			it++;
		}
	}else if(inst->getType() == Instruction::Type::ASSIGNMENT){
		// a = b
		// totes aquelles expressions amb argument "a" deixen d'estar disponibles
		AssignmentInstruction *aux = (AssignmentInstruction *) inst;
		if(aux->getType() == AssignmentInstruction::Type::SIMPLE){
			// és una assignació de l'estil a = b
			std::list<std::string> &tmp = aux->getDesti()->getExpressionList();

			// tmp és una llista que conté identificadors d'expressions que fan ús
			// de la variable "a"

			std::list<std::string>::iterator it = tmp.begin();
			while(it != tmp.end()){
				auto exp = this->hashExpressions.find(*it);
				if(exp != this->hashExpressions.end()){
					// és una expressió que existeix en aquest domini
					gk.gains.remove(exp->second);
					gk.kills.put(exp->second);
				}

				it++;
			}
		}
	}
}

/**
 * Calcula el conjunt In i Out per cada un dels blocs bàsics
 */
void AvailableExpressions::calculateInOut()
{
	std::list<BasicBlock *> pendents;

	// afegir tots els successors del primer bloc
	std::list<BasicBlock *> &successors = this->subprograma->getEntryBlock()->getSuccessors();
	std::list<BasicBlock *>::iterator myIt = successors.begin();
	while(myIt != successors.end()){
		pendents.push_back(*myIt);
		myIt++;
	}

	while(pendents.size() > 0){
		BasicBlock *actual = pendents.front();
		pendents.pop_front();

		assert(actual != nullptr);

		// calcular l'in d'aqpuest bloc
		Set<struct Expression> tmpIn(this->domini);
		tmpIn.putAll();
		
		std::list<BasicBlock *> predecessors = actual->getPredecessors();
		std::list<BasicBlock *>::iterator it = predecessors.begin();
		while(it != predecessors.end()){
			auto aux = this->inOut.find(*it);
			if(aux != this->inOut.end()){
				// existeix el bloc bàsic
				// kills és l'out
				tmpIn.intersection(aux->second.kills);
				it++;
			}
		}

		// calcular l'out del conjunt
		struct AvailableExpressions::GK gk = this->calculateGK(actual);
		Set<AvailableExpressions::Expression> outNou = tmpIn;
		outNou.difference(gk.kills);
		outNou.add(gk.gains);

		// obtenir l'out actual
		auto aux = this->inOut.find(actual);
		if(aux != this->inOut.end() && outNou != aux->second.kills){
			aux->second.gains = tmpIn;
			aux->second.kills = outNou;
			
			// s'han produit canvis, s'han de revisar tots els successors
			std::list<BasicBlock *> successors = actual->getSuccessors();
			std::list<BasicBlock *>::iterator it = successors.begin();
			while(it != successors.end()){
				if(*it == this->subprograma->getExitBlock()){
					it++;
					continue;
				}

				pendents.push_back(*it);
				it++;
			}
		}
	}
}


/**
 * Aplica les optimitzacions d'expressions disponibles
 */
bool AvailableExpressions::optimize(CodeGeneration *code)
{
	bool canvis = false;

	// anar bloc a bloc a veure si es poden substituir expressions disponibles
	BasicBlock *actual = this->subprograma->getEntryBlock();
	while(actual != nullptr && actual != this->subprograma->getExitBlock()){
		// obtenir el conjunt d'expressions disponibles a l'entrada del bloc
		auto tmp = this->inOut.find(actual);
		assert(tmp != this->inOut.end());

		// l'estructura inOut conté l'in (gains) i out (kills) del bloc
		struct AvailableExpressions::GK inout = tmp->second;
		struct AvailableExpressions::GK ed;
		ed.gains = inout.gains;
		ed.kills = Set<struct Expression>(this->domini);

		Instruction *aux = actual->getStart();
		Instruction *end = actual->getEnd();

		while(aux != nullptr && aux != end){
			// la següent instrucció és la següent de la instrucció actual
			// ignorant que es puguin afegir instruccions en aquesta iteració
			Instruction *next = aux->getNext();

			if(aux->getType() == Instruction::Type::ARITHMETIC){
				// comprovar que l'expressió està disponible
				ArithmeticInstruction *aInst = (ArithmeticInstruction *) aux;
				struct Expression *setElement = this->hashExpressions.find(aInst->getExpressionId())->second;

				if(ed.gains.contains(setElement)){
					// es pot substituir directament per la instrucció x = t
					Instruction *initA = code->addInstruction(new AssignmentInstruction(
						aInst->getDesti(),
						setElement->exp
					));

					initA->markAtOptimization();

					code->move(initA, initA, aInst);
					code->remove(aInst);

					this->calculateGK(ed, initA);
				}else{
					// no està disponible, és la primera vegada que es troba l'expressió
					// substituir la instrucció de
					// d = a op b per x = t
					// i afegir abans de x = t la instrucció t = a op b

					if(aInst->isAddedAtOptimization()){
						// aquesta instrucció es pot haver aplicar en passades anteriors
						// no es tornarà a crear una altra instrucció
						if(setElement->exp == nullptr){
							setElement->exp = aInst->getDesti();
						}

						this->calculateGK(ed, aInst);
					}else{
						Variable *t = setElement->exp;
						if(t == nullptr){
							// és la primera vegada que apareix aquesta expressió
							setElement->exp = code->addVariable(aInst->getDesti()->getTSB());
							t = setElement->exp;
							t->setConstant(false);
						}

						// creació de t = a op b
						Instruction *assignmentT = code->addInstruction(new ArithmeticInstruction(
							aInst->getOperator(),
							t,
							aInst->getFirstOperand(),
							aInst->getSecondOperand()
						));

						assignmentT->markAtOptimization();

						// substituir càlcul expressió per assignació
						Instruction *initA = code->addInstruction(new AssignmentInstruction(
							aInst->getDesti(),
							t
						));

						initA->markAtOptimization();

						code->move(assignmentT, initA, aInst);
						code->remove(aInst);

						this->calculateGK(ed, assignmentT);
						this->calculateGK(ed, initA);
					}
				}
			}else if(aux->getType() == Instruction::Type::ASSIGNMENT){
				this->calculateGK(ed, aux);
			}

			aux = next;
		}

		actual = actual->getNext();
	}

	return canvis;
}