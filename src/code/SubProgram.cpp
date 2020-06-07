#include "SubProgram.h"
#include "Variable.h"
#include "instructions/Instruction.h"
#include "instructions/SkipInstruction.h"
#include "instructions/GoToInstruction.h"
#include "instructions/CondJumpInstruction.h"
#include "BasicBlock.h"
#include "CodeGeneration.h"
#include "../utils/Domain.hpp"
#include "../utils/Set.hpp"
#include "optimizations/AvailableExpressions.h"
#include "optimizations/LoopOptimization.h"
#include "optimizations/LiveVariables.h"
#include <iostream>

SubProgram::SubProgram(int np, Label *start, std::string id, bool esExtern) 
	: basicBlocks(nullptr), codiExtern(esExtern), firstTime(true)
{
    this->nivellProfunditat = np;
    this->nom = id;
	this->start = start;

	this->numParametres = 0;
	this->ocupacioParametres = 0;

	// el paràmetres es troben per "davall" del base pointers, és a dir
	// a posicions de memòria més grans
	this->currentOffsetParametres = 8; // per l'adreça de retorn

	// les variables locals es troben a posicions de memòria inferiors
	this->currentOffsetVariables = -8; // pel base pointer anterior

	// inicialment els subprogrames no són funcions
	this->returnTSB = TipusSubjacentBasic::NUL;

	this->variablesLocals.clear();
}

SubProgram::~SubProgram() {};

void SubProgram::setNP(int np) {
    this->nivellProfunditat = np;
}

int SubProgram::getNivellProfunditat() {
	return this->nivellProfunditat;
}

int SubProgram::getOcupacioVariables() {
	
	int mod = 0;
	if(this->ocupacioVariables % 8 != 0){
		mod = (this->ocupacioVariables / 8 + 1) * 8 - this->ocupacioVariables;
	}

	return this->ocupacioVariables + mod;
}

/**
 * Afegeix una variable com a paràmetre del subprograma
 */
void SubProgram::addParameter(Variable *var) {
	if(var == nullptr || !var->isParameter()) {
		return;
	}

	this->ocupacioParametres += var->getOcupacio();

	// i actualitza l'offset dels paràmetres
	// els paràmetres es troben a posicions de memòria més grans
	// que el base pointer
	var->setOffset(this->currentOffsetParametres);
	this->currentOffsetParametres += var->getOcupacio();

	this->numParametres++;

	std::cout << "Afegint paràmetre a " << this->getNom() << ". Total = " << this->ocupacioParametres << std::endl;
}

/**
 * Afegeix una variable com a variable local del subprograma
 */
void SubProgram::addVariable(Variable *var) {
	if(var == nullptr || var->isParameter()){
		return;
	}

	this->ocupacioVariables += var->getOcupacio();

	// actualitza l'offset de la variable (amb aquest ordre)
	this->currentOffsetVariables -= var->getOcupacio();
	var->setOffset(this->currentOffsetVariables);

	if(var->getTSB() == TipusSubjacentBasic::ARRAY || var->getTSB() == TipusSubjacentBasic::POINTER){
		// és possible que tengui un espai extra
		std::cout << "Ocupació (var = "<< var->getNom() <<") extra TSB " << var->getTSB() << " és = " << var->getOcupacioExtra() << std::endl;

		this->currentOffsetVariables -= var->getOcupacioExtra();
		this->ocupacioVariables += var->getOcupacioExtra();
	}

	// afegir la variable a la llista de variables
	this->variablesLocals.push_back(var);
}

std::list<Variable *> SubProgram::getVariables() {
	return this->variablesLocals;
}

/**
 * Retorna l'ocupació dels paràmetres d'un subprograma
 * L'ocupació ha de ser un múltiple de 8 per mantenir la pila alineada
 */
int SubProgram::getOcupacioParametres(){
	int ocupacio = this->ocupacioParametres;
	
	// si és una funció s'ha d'incloure el tipus de retorn
	if (this->returnTSB != TipusSubjacentBasic::NUL) {
		ocupacio += TSB::sizeOf(this->returnTSB);
	}

	int mod = 0;
	if(ocupacio % 8 != 0){
		mod = (ocupacio / 8 + 1) * 8 - ocupacio;
	}
	
	return ocupacio + mod;
}

/**
 * Reinicia els comptadors d'espai i offset a 0 per
 * recalcular l'espai ocupat per les variables locals
 */
void SubProgram::resetOffsets(){
	this->ocupacioVariables = 0;
	this->currentOffsetVariables = -8;
}

std::string SubProgram::getNom() {
	return this->start->toString();
}

/**
 * Indica que és una funció i actualitza els offsets dels paràmetres
 */
void SubProgram::setTipusRetorn(TipusSubjacentBasic tsb){
	this->returnTSB = tsb;
}

/**
 * Una funció té un tipus retorn, que s'ha simulat com un paràmetre més
 */
int SubProgram::getOffsetRetorn(){
	return this->currentOffsetParametres;
}

/**
 * Elimina una instrucció d'un subprograma, gestionant si és o no 
 * la darrera instrucció
 */
void SubProgram::removeInstruction(Instruction *instruction){
	if(instruction->getInvokingSubProgram() != this){
		// s'intenta eliminar una instrucció que no és d'aquest subprograma
		std::cerr << "Intentat eliminar instrucció de programa equivocat" << std::endl;
		return;
	}

	if(instruction == this->lastInstruction){
		// s'intenta eliminar la darrera instrucció d'un subprograma
		// sempre hi haurà, com a mínim, la instrucció skip de l'etiqueta
		this->lastInstruction = this->lastInstruction->getPrevious();
	}
}

Instruction *SubProgram::getFirstInstruction(){
	// la primera instrucció del subprograma és la seva instrucció
	// de skip
	return (Instruction *) this->start->getTargetInstruction();
}

Instruction *SubProgram::getLastInstruction(){
	return this->lastInstruction;
}

void SubProgram::setLastInstruction(Instruction *instruction){
	this->lastInstruction = instruction;
}

#include <cassert>

/**
 * Calcula quins són els blocs bàsics d'aquest subprograma
 */
void SubProgram::updateBasicBlocks(CodeGeneration *code){
	if(!this->start->isUsed() || this->codiExtern){
		// el subprograma no s'utilitza!
		// o no s'ha creat mitjançat generació de codi
		return;
	}

	// borrar els possibles blocs bàsics
	if(this->basicBlocks != nullptr){
		while(this->basicBlocks != nullptr){
			BasicBlock *tmp = this->basicBlocks->getNext();
			delete this->basicBlocks;
			this->basicBlocks = tmp;
		}
	}

	Instruction *actual = this->getFirstInstruction();
	Instruction *end = this->lastInstruction;

	// creant blocs d'inici i final
	BasicBlock *entry = new BasicBlock(nullptr);
	BasicBlock *exit = new BasicBlock(nullptr);

	BasicBlock *last = entry;

	// detectar els inicis dels diferents blocs
	while(actual != end->getNext()){
		if(actual->getType() == Instruction::Type::SKIP){
			// comença un nou bloc bàsic
			BasicBlock *block = new BasicBlock(actual);

			// actualitzar la taula d'etiquetes
			((SkipInstruction *) actual)->getLabel()->setBlock(block);

			block->setPrevious(last);
			last->setNext(block);
			last = block;

			// indicar que pertany al block
			actual->setBasicBlock(block);
		}else if(actual->getType() == Instruction::Type::CONDJUMP){
			Instruction *next = actual->getNext();

			// segur que hi haurà qualque instrucció a continuació
			// com a mínim un return per indicar el final del 
			// subprograma
				
			switch (next->getType()){
				case Instruction::Type::RETURN:
				case Instruction::Type::SKIP:
				case Instruction::Type::CONDJUMP:
				case Instruction::Type::GOTO:
					break;

				default: // qualsevol altre instrucció
					// la següent línia és un nou bloc
					BasicBlock *block = new BasicBlock(next);

					block->setPrevious(last);
					last->setNext(block);
					last = block;
					
			}

			assert(actual->getPrevious() != nullptr);
			actual->setBasicBlock(actual->getPrevious()->getBasicBlock());
		}else{
			// el bloc bàsic és el mateix que la instrucció anterior
			// necessàriament existeix una instrucció anterior
			// perquè com a mínim hi haurà l'skip del subprograma
			assert(actual->getPrevious() != nullptr);
			actual->setBasicBlock(last);
		}

		actual = actual->getNext();
	}

	exit->setPrevious(last);
	last->setNext(exit);
	last = exit;

	// detectar el final dels blocs
	entry->addEdge(entry->getNext(), false);

	BasicBlock *bloc = entry->getNext();
	while(bloc != nullptr && bloc != exit){
		Instruction *inst =  bloc->getStart();

		// cercar la primera instrucció que pugui ser el final de bloc
		while(inst->getType() != Instruction::Type::GOTO
				&& inst->getType() != Instruction::Type::CONDJUMP
				&& inst->getType() != Instruction::Type::RETURN
				&& ((inst->getType() != Instruction::Type::SKIP)  || ((inst->getType() == Instruction::Type::SKIP) 
						&& ((SkipInstruction *) inst)->getLabel()->getBlock() == bloc)))
		{
			inst = inst->getNext();
		}

		// els blocs condicionals formen part del mateix bloc
		while(inst->getType() == Instruction::Type::CONDJUMP){
			// actualitzar la llista de successors i predecessors
			CondJumpInstruction *tmp = (CondJumpInstruction *) inst;
			bloc->addEdge(tmp->getTarget()->getBlock(), false);

			inst = inst->getNext();
		}

		// determinar com acaba el bloc
		if(inst->getType() == Instruction::Type::GOTO){
			bloc->setEnd(inst);
			
			Label *target = ((GoToInstruction *) inst)->getTarget();
			bloc->addEdge(target->getBlock(), false);
		}else if(inst->getType() == Instruction::Type::RETURN){
			bloc->setEnd(inst);
			bloc->addEdge(exit, false);
		}else{
			// el bloc que el segueix és un bloc bàsic adjacent
			bloc->setEnd(inst->getPrevious());
			bloc->addEdge(bloc->getNext(), true);
		}

		bloc = bloc->getNext();
	}

	// indicar els blocs al subprograma
	this->basicBlocks = entry;
	this->exitBlock = exit;

	// eliminar aquells blocs que no són accessibles
	std::list<BasicBlock *> pendents;
	std::map<BasicBlock *, bool> visitats;
	visitats.emplace(entry, true);
	pendents.push_back(entry);
	while(pendents.size() > 0){
		BasicBlock *aux = pendents.front();
		pendents.pop_front();

		// afegir tots els successors no visitats
		std::list<BasicBlock *> &successors = aux->getSuccessors();
		std::list<BasicBlock *>::iterator it = successors.begin();
		while(it != successors.end()){
			auto visitat = visitats.find(*it);
			if(visitat == visitats.end()){
				// no s'ha visitat
				visitats.emplace(*it, true);
				pendents.push_back(*it);
			}
			it++;
		}
	}

	// recòrrer i eliminar tots aquells blocs que no estiguin dins visitats
	/*BasicBlock *aux = this->getEntryBlock();
	while(aux != nullptr){
		BasicBlock *next = aux->getNext();
		auto visitat = visitats.find(aux);

		if(visitat == visitats.end()){
			// no s'ha visitat
			// per tant es pot eliminar el bloc bàsic
			this->deleteBasicBlock(code, aux);
		}

		aux = next;
	}*/

	// actualitzar els dominadors
	this->updateDominadors();
}

/**
 * Calcula el conjunt de dominadors i dominadors
 * immediat de cada un dels blocs bàsics
 */
void SubProgram::updateDominadors(){
	// el bloc bàsic d'entrada és el primer de la llista
	BasicBlock *entry = this->basicBlocks;

	// calcular el conjunt de dominadors de cada un dels elements
	// crear el domini del conjunt (que són tots els blocs bàsics)
	std::list<BasicBlock *> list;
	list.clear();

	BasicBlock *tmp = this->basicBlocks;
	while(tmp != nullptr){
		list.push_back(tmp);
		tmp = tmp->getNext();
	}

	std::shared_ptr<Domain<BasicBlock>> domini = std::make_shared<Domain<BasicBlock>>(list);
	Set<BasicBlock> bb(domini);
	bb.putAll();

	// inicilitzant dominadors: inicialment tots els blocs bàsics
	// tenen com a dominadors tots els blocs
	tmp = this->basicBlocks;
	while(tmp != nullptr){
		Set<BasicBlock> tmpSet = bb;
		tmpSet.putAll();
		tmp->setDominadors(tmpSet);
		tmp = tmp->getNext();
	}

	Set<BasicBlock> entrySet(domini);
	entrySet.removeAll();
	entrySet.put(entry);
	entry->setDominadors(entrySet);

	// inicialment tots els elements són pendents
	std::list<BasicBlock *> pendents = list;
	Set<BasicBlock> pendentsReals(domini);

	// excepte el bloc bàsic d'entrada, que és el primer
	pendents.pop_front();
	pendentsReals.remove(entry);

	// mentre quedin blocs per analitzar
	while(pendents.size() > 0){
		BasicBlock *actual = pendents.front();
		pendents.pop_front();
		pendentsReals.remove(actual);

		// el conjunt de dominadors és la intersecció entre BB i tots els conjunts
		// de dominadors dels predecessors
		Set<BasicBlock> d(domini);
		d.putAll();

		// recòrrer els predecessors
		std::list<BasicBlock *> predecessors = actual->getPredecessors();
		std::list<BasicBlock *>::iterator it = predecessors.begin();
		while(it != predecessors.end()){
			Set<BasicBlock> &aux = (*it)->getDominadors();
			d.intersection(aux);
			it++;
		}
		d.put(actual);

		if(d != actual->getDominadors()){
			// s'han detectat canvis
			std::list<BasicBlock *> successors = actual->getSuccessors();
			std::list<BasicBlock *>::iterator aux = successors.begin();
			while(aux != successors.end()){
				if(!pendentsReals.contains(*aux)){
					pendents.push_back(*aux);
					pendentsReals.put(*aux);
				}
				aux++;
			}

			actual->setDominadors(d);
		}
	}

	this->draw();

	// calcular el dominador immediat de cada bloc bàsic
	BasicBlock *aux = this->basicBlocks->getNext(); // segur que hi ha l'entry
	entry->setDominadorImmediat(entry);
	while(aux != nullptr){
		aux->updateDominadorImmediat();
		aux = aux->getNext();
	}
}


/**
 * Aplica els mètodes d'optimització locals al subprograma
 */
bool SubProgram::optimize(CodeGeneration *code){
	std::cout << "Optimització local de " << this->nom << std::endl;

	if(this->basicBlocks == nullptr){
		return false;
	}

	std::cout << "Optimització local de " << this->nom << " comença" << std::endl;


	bool canvis = false;


	AvailableExpressions availableExpressions = AvailableExpressions(this);

	std::cout << "Optimització local de " << this->nom << " comença opti" << std::endl;
	availableExpressions.optimize(code);

	std::cout << "Optimització local de " << this->nom << " loops" << std::endl;


	this->updateBasicBlocks(code);


	LoopOptimization loopOptimization = LoopOptimization(code, this);
	
	if(!firstTime){
		canvis = loopOptimization.optimize(code) || canvis;
	}else{
		firstTime = false;
	}

	this->updateBasicBlocks(code);

	std::cout << "Variables vives init" << std::endl;
	LiveVariables liveVariables = LiveVariables(code, this);
	std::cout << "Variables vives optimització start" << std::endl;
	liveVariables.optimize(code);
	std::cout << "Variables vives optimització end" << std::endl;



	return canvis || firstTime;
}

/**
 * Elimina un bloc bàsics de la llista de blocs bàsics
 */
void SubProgram::deleteBasicBlock(CodeGeneration *code, BasicBlock *block){
	if(block == this->basicBlocks){
		this->basicBlocks = block->getNext();
	}

	if(block->getPrevious() != nullptr){
		block->getPrevious()->setNext(block->getNext());
	}

	if(block->getNext() != nullptr){
		block->getNext()->setPrevious(block->getPrevious());
	}

	if(this->exitBlock == block){
		this->exitBlock = block->getPrevious();
		if(this->exitBlock != nullptr){
			this->exitBlock->setNext(nullptr);
		}
	}

	// eliminar-lo de predecessor a tots els successors
	std::list<BasicBlock *> &successors = block->getSuccessors();
	std::list<BasicBlock *>::iterator it = successors.begin();
	while(it != successors.end()){
		(*it)->getPredecessors().remove(block);
		it++;
	}

	// eliminar totes les instruccions del bloc bàsic
	block->remove(code);

	// i alliberar la memòria del bloc
	delete block;
}

int myTmpId = 0;

void SubProgram::draw(){
	if(!this->start->isUsed()){
		return;
	}

	std::ofstream f(this->getNom() + "_blocs_" + std::to_string(myTmpId++) + ".dot");

	f << "digraph {" << std::endl;

	BasicBlock *b = this->basicBlocks;

	while(b != nullptr){
		std::list<BasicBlock *> succ = b->getSuccessors();
		std::list<BasicBlock *>::iterator it = succ.begin();

		std::string auxStr = "";
		Set<BasicBlock>::iterator auxIt = b->getDominadors().begin();
		while(auxIt < b->getDominadors().end()){
			auxStr += std::to_string((*auxIt)->mId) + ", ";
			auxIt++;
		}
		
		if(b->getDominadorImmediat() != nullptr){
			auxStr += " => DI = " + std::to_string(b->getDominadorImmediat()->mId);
		}

		f << b->mId << "[label=\""<< b->mId << "\", xlabel=\""<< auxStr <<"\"]" << std::endl;

		while(it != succ.end()){
			f << b->mId << " -> " << (*it)->mId << std::endl;
			it++;
		}

		b = b->getNext();
	}

	f << "}" << std::endl;
	f.close();
}


void SubProgram::setEntryBlock(BasicBlock *block){
	this->basicBlocks = block;
}

BasicBlock *SubProgram::getEntryBlock(){ return this->basicBlocks; }
BasicBlock *SubProgram::getExitBlock(){ return this->exitBlock; }

void SubProgram::markUsage(){
	this->start->markUsage();
}

bool SubProgram::isExtern(){
	return this->codiExtern;
}

/**
 * Retorna una conjunt amb el domini dels blocs bàsics
 * del subprograma
 */
Set<BasicBlock> SubProgram::getBasicBlocks(){
	// crear el domini
	std::list<BasicBlock *> list;
	list.clear();

	BasicBlock *tmp = this->basicBlocks;
	while(tmp != nullptr){
		list.push_back(tmp);
		tmp = tmp->getNext();
	}

	std::shared_ptr<Domain<BasicBlock>> domini = std::make_shared<Domain<BasicBlock>>(list);
	Set<BasicBlock> bb(domini);
	
	return bb;
}