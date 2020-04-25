#include "SubProgram.h"
#include "Variable.h"
#include "instructions/Instruction.h"
#include "instructions/SkipInstruction.h"
#include "instructions/GoToInstruction.h"
#include "instructions/CondJumpInstruction.h"
#include "BasicBlock.h"
#include "CodeGeneration.h"
#include <iostream>

SubProgram::SubProgram(int np, Label *start, std::string id) 
	: basicBlocks(nullptr)
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

/**
 * Calcula quins són els blocs bàsics d'aquest subprograma
 */
void SubProgram::updateBasicBlocks(){
	if(!this->start->isUsed()){
		// el subprograma no s'utilitza!
		return;
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
				case Instruction::Type::ASSEMBLY: // no és pròpiament una instrucció C3@
				case Instruction::Type::MEMORY: // a efectes de blocs bàsics, no ha de fer res
					break;

				default: // qualsevol altre instrucció
					// la següent línia és un nou bloc
					BasicBlock *block = new BasicBlock(next);

					block->setPrevious(last);
					last->setNext(block);
					last = block;
					
			}
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
				&& (inst->getType() == Instruction::SKIP 
						&& ((SkipInstruction *) inst)->getLabel()->getBlock() == bloc))
		{
			inst = inst->getNext();
		}

		// els blocs condicionals formen part del mateix bloc
		while(inst->getType() == Instruction::Type::CONDJUMP){
			if(inst->getType() == Instruction::Type::MEMORY 
				|| inst->getType() == Instruction::Type::ASSEMBLY)
			{
				// no s'han de tenir en compte
				inst = inst->getNext();
				continue;
			}

			// actualitzar la llista de successors i predecessors
			CondJumpInstruction *tmp = (CondJumpInstruction *) inst;
			bloc->addEdge(tmp->getTarget()->getBlock(), false);

			inst = inst->getNext();
		}

		std::cout << "Instrucció final de bloc és " << inst->getType() << std::endl;

		// determinar com acaba el bloc
		if(inst->getType() == Instruction::Type::GOTO){
			bloc->setEnd(inst);
			
			std::cout << "====> Afegint Aresta GOTO " << std::endl;

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

		std::cout << "Aresta final afegida" << std::endl;

		bloc = bloc->getNext();
	}

	std::cout << "S'ha acabat detecció" << std::endl;

	// indicar els blocs al subprograma
	this->basicBlocks = entry;

	// comptar número de blocs
	bloc = entry;
	int i = 0;
	while(bloc != nullptr){
		std::cout << "I = " << i << std::endl;
		i++;
		bloc = bloc->getNext();
	}

	std::cout << "S'han trobat " << i << " blocs" << std::endl;
}


bool SubProgram::optimize(CodeGeneration *code){
	if(this->basicBlocks == nullptr){
		return false;
	}

	bool canvis = false;

	// analitzar si els blocs bàsics es poden eliminar
	BasicBlock *actual = this->basicBlocks->getNext();
	while(actual != nullptr && actual->getNext() != nullptr){
		bool eliminat = actual->optimize(code);
		canvis = canvis || eliminat;

		if(eliminat){
			std::cout << "Eliminat bloc bàsic" << std::endl;

			if(actual == this->basicBlocks){
				this->basicBlocks = actual->getNext();
			}

			if(actual->getPrevious() != nullptr){
				actual->getPrevious()->setNext(actual->getNext());
			}

			if(actual->getNext() != nullptr){
				actual->getNext()->setPrevious(actual->getPrevious());
			}
		}

		actual = actual->getNext();
	}

	return canvis;
}

void SubProgram::draw(){
	std::ofstream f(this->getNom() + "_blocs.dot");

	f << "digraph {" << std::endl;

	BasicBlock *b = this->basicBlocks;
	while(b != nullptr){
		std::list<BasicBlock *> succ = b->getSuccessors();
		std::list<BasicBlock *>::iterator it = succ.begin();

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

void SubProgram::markUsage(){
	this->start->markUsage();
}