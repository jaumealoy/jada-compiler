#include "BasicBlock.h"
#include "CodeGeneration.h"

BasicBlock::BasicBlock(Instruction *inst) 
	: start(inst)
{

}

BasicBlock::~BasicBlock(){}

/**
 * Elimina les instruccions d'un bloc bàsic
 */
void BasicBlock::remove(CodeGeneration *code){
	Instruction *inst = this->start;

	while(inst != this->end){
		Instruction *next = inst->getNext();
		code->remove(inst);
		inst = next;
	}
	
	code->remove(this->end);
}

void BasicBlock::setEnd(Instruction *inst) {
	this->end = inst;
}

Instruction *BasicBlock::getEnd(){ return this->end; }
Instruction *BasicBlock::getStart(){ return this->start; }

/**
 * Afegeix un successor, si no existeix
 */
void BasicBlock::addEdge(BasicBlock *block, bool adjacent){
	// afegir aquest bloc com a successor, si no existeix
	std::list<BasicBlock *>::iterator it = this->successors.begin();
	bool trobat = false;
	while(!trobat && it != this->successors.end()){
		trobat = block == *it;
		it++;
	}

	if(trobat) return; // ja està afegit

	// afegir al prinicipi o al final en funció de si és un bloc bàsic adjacent
	if(adjacent){
		this->successors.push_front(block);
	}else{
		this->successors.push_back(block);
	}

	// actualitzar els predecessors de l'altre block
	block->predecessors.push_back(this);
}

void BasicBlock::setPrevious(BasicBlock *bloc){ this->prev = bloc; }
BasicBlock *BasicBlock::getPrevious(){ return this->prev; }

void BasicBlock::setNext(BasicBlock *bloc){ this->next = bloc; }
BasicBlock *BasicBlock::getNext(){ return this->next; }