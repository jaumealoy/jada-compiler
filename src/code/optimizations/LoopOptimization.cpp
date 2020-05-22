#include "LoopOptimization.h"
#include "../CodeGeneration.h"

#include <iostream>

LoopOptimization::LoopOptimization(SubProgram *programa)
{
	// identificar els diferents bucles
	// això és identificar aquelles arestes x -> d tals que 
	// d domina a x
	BasicBlock *block = programa->getEntryBlock()->getNext();
	while(block != nullptr && block != programa->getExitBlock()){
		std::list<BasicBlock *> &successors = block->getSuccessors();
		std::list<BasicBlock *>::iterator it = successors.begin();
		while(it != successors.end()){
			if(block->getDominadors().contains(*it)){
				std::cout << "Detectat bucle entre block " << block->mId << " i " << (*it)->mId << std::endl;
			}
			it++;
		}

		block = block->getNext();
	}

	// ordenació topològica dels blocs, per determinar en quin ordre s'han
	// de processar els diferents bucles
	std::map<BasicBlock *, bool> visited;
	std::vector<BasicBlock *> nodes;
	otb(nodes, visited, this->programa->getEntryBlock());
}

LoopOptimization::~LoopOptimization()
{

}

bool LoopOptimization::optimize(CodeGeneration *code){
	return false;
}

/**
 * Ordenació topològica dels blocs
 * És un recorregut sobre el graf: visita successors i afegeix node actual
 */
void LoopOptimization::otb(std::vector<BasicBlock *> nodes, std::map<BasicBlock *, bool> visitats, BasicBlock *actual)
{
	// comprovar si el node actual ja ha estat visitat
	auto nodeActual = visitats.find(actual);
	if(nodeActual == visitats.end()){
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