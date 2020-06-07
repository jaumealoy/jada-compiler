#include "LiveVariables.h"
#include "../instructions/AssignmentInstruction.h"
#include "../instructions/ArithmeticInstruction.h"
#include "../instructions/CallInstruction.h"
#include "../instructions/PutParamInstruction.h"
#include "../instructions/ReturnInstruction.h"
#include "../CodeGeneration.h"

void addIfNotExists(std::map<Variable *, bool> &map, Variable *var);

LiveVariables::LiveVariables(CodeGeneration *code, SubProgram *programa)
	: programa(programa)
{
	// identificar el domini, és a dir, totes les variables
	// que s'utilitzen
	/*std::map<Variable *, bool> varTrobades;

	Instruction *aux = programa->getFirstInstruction();
	Instruction *end = programa->getLastInstruction()->getNext();
	while(aux != end){
		switch(aux->getType()){
			case Instruction::ASSIGNMENT:
			{
				AssignmentInstruction *aInst = (AssignmentInstruction *) aux;
				
				switch(aInst->getType()){
					case AssignmentInstruction::Type::SIMPLE: 
					{
						// de la forma a = b o a = constant
						if(aInst->getOrigen() != nullptr){
							addIfNotExists(varTrobades, aInst->getOrigen());
						}
						break;
					}

					default:
					{
						// altres casos a[c] = b o a = b[c]
						addIfNotExists(varTrobades, aInst->getOrigen());
						addIfNotExists(varTrobades, aInst->getDesti());
						addIfNotExists(varTrobades, aInst->getOffset());
					}
				}

				break;
			}

			case Instruction::ARITHMETIC:
			case Instruction::CALL: 
			{
				break;
			}
			case Instruction::PUTPARAM:
			case Instruction::CONDJUMP:
		}

		aux = aux->getNext();
	}*/

	std::list<Variable *> variables = programa->getVariables();
	std::list<Variable *> &globals = code->getGlobalVariables();
	std::list<Variable *>::iterator gIt = globals.begin();
	while(gIt != globals.end()){
		variables.push_back(*gIt);
		gIt++;
	}

	this->domini = std::make_shared<Domain<Variable>>(variables);
}

LiveVariables::~LiveVariables()
{

}

/**
 * Actualitza els conjunts G i K després d'haver processat la instrucció
 * tenint en compte que l'anàlisi es realitza en sentit ascendent
 */
void LiveVariables::calculateGK(struct LiveVariables::GK &gk, Instruction *actual)
{
	switch(actual->getType()){
		case Instruction::ARITHMETIC:
		{
			ArithmeticInstruction *aInst = (ArithmeticInstruction *) actual;
			gk.gains.remove(aInst->getDesti());
			gk.gains.put(aInst->getFirstOperand());
			gk.gains.put(aInst->getSecondOperand());
			gk.kills.put(aInst->getDesti());
			break;
		}

		case Instruction::ASSIGNMENT:
		{
			AssignmentInstruction *aInst = (AssignmentInstruction *) actual;
			switch(aInst->getType()){
				case AssignmentInstruction::Type::SIMPLE:
				{
					if(aInst->getOrigen() == nullptr){
						// és de la forma a = constant
						gk.gains.remove(aInst->getDesti());
						gk.kills.put(aInst->getDesti());
					}else{
						// és de la forma a = b
						gk.gains.remove(aInst->getDesti());
						gk.gains.put(aInst->getOrigen());
						gk.kills.put(aInst->getDesti());
					}

					break;
				}

				case AssignmentInstruction::Type::TARGET_OFF:
				{
					// és de la forma a[c] = b
					// totes les variables s'utilitzen com arguments
					gk.gains.put(aInst->getDesti());
					gk.gains.put(aInst->getOffset());
					gk.gains.put(aInst->getOrigen());

					break;
				}

				case AssignmentInstruction::Type::SOURCE_OFF:
				{
					// és de la forma a = b[c]
					// a és el desti, b i c són arguments
					gk.gains.remove(aInst->getDesti());
					gk.gains.put(aInst->getOrigen());
					gk.gains.put(aInst->getOffset());
					gk.kills.put(aInst->getDesti());
					break;
				}
			}
		}

		case Instruction::PUTPARAM:
		{
			// només té un única variable que és l'argument que es passa
			PutParamInstruction *ppinst = (PutParamInstruction *) actual;
			gk.gains.put(ppinst->getValor());
			break;
		}

		case Instruction::CALL:
		{
			CallInstruction *cInst = (CallInstruction *) actual;
			if(cInst->getDesti() != nullptr){
				// les crides a funcions retornen un valor que es guarda dins
				// una variable
				gk.gains.remove(cInst->getDesti());
				gk.kills.put(cInst->getDesti());
			}

			break;
		}

		case Instruction::RETURN:
		{
			ReturnInstruction *rInst = (ReturnInstruction *) actual;
			if(rInst->getValor() != nullptr){
				gk.gains.put(rInst->getValor());
			}
	
			break;
		}
	}
}

/**
 * Calcula el conjunt de guanys i eliminacions donat un bloc bàsic
 */
struct LiveVariables::GK LiveVariables::calculateGK(BasicBlock *bloc)
{
	struct LiveVariables::GK gk;
	gk.gains = Set<Variable>(this->domini);
	gk.kills = Set<Variable>(this->domini);
	
	Instruction *aux = bloc->getEnd();
	Instruction *end = bloc->getStart()->getPrevious();
	while(aux != end){
		this->calculateGK(gk, aux);
		aux = aux->getPrevious();
	}

	return gk;
}

void LiveVariables::calculateInOut(){
	// inicialitzar el conjunt d'in dels diferents blocs bàsics
	BasicBlock *aux = this->programa->getEntryBlock()->getNext();
	while(aux != nullptr && aux != this->programa->getExitBlock()){
		struct LiveVariables::GK tmp;
		tmp.gains = Set<Variable>(this->domini);
		tmp.kills = Set<Variable>(this->domini);
		this->inOut.emplace(aux, tmp);
		aux = aux->getNext();
	}

	// TODO: determinar quin és el conjunt d'entrada del exit block
	// totes les variables globals i punters/arrays

	std::list<BasicBlock *> pendents = this->programa->getExitBlock()->getPredecessors();
	while(pendents.size() > 0){
		BasicBlock *actual = pendents.front();
		pendents.pop_front();

		Set<Variable> tmpOut(this->domini);
		tmpOut.removeAll();

		// l'out d'un bloc és la unió dels ins dels successors
		std::list<BasicBlock *> &successors = actual->getSuccessors();
		std::list<BasicBlock *>::iterator it = successors.begin();
		while(it != successors.end()){
			auto aux = this->inOut.find(*it);
			if(aux != this->inOut.end()){
				tmpOut.add(aux->second.gains);
			}
			it++;
		}

		// calcular l'in del bloc bàsic
		struct LiveVariables::GK gk = this->calculateGK(actual);
		Set<Variable> inNou = tmpOut;
		inNou.difference(gk.kills);
		inNou.add(gk.gains);

		auto aux = this->inOut.find(actual);
		if(aux != this->inOut.end()){
			aux->second.kills = tmpOut;

			if(inNou != aux->second.gains){
				aux->second.gains = inNou;
				
				// afegir tots els predecessors a la llista de pendents
				std::list<BasicBlock *> &predecessors = actual->getPredecessors();
				std::list<BasicBlock *>::iterator it = predecessors.begin();
				while(it != predecessors.end()){
					pendents.push_back(*it);
					it++;
				}
			}
		}
	}
}

/**
 * Aplica les optimitzacions de variables vives. Les assignacions a variables
 * no vives es poden evitar
 */
bool LiveVariables::optimize(CodeGeneration *code)
{
	bool canvis = true;

	// aplicar les optimitzacions per blocs bàsics
	BasicBlock *actual = this->programa->getEntryBlock()->getNext();
	while(actual != nullptr && actual != this->programa->getExitBlock()){
		Instruction *aux = actual->getEnd();
		Instruction *end = actual->getStart()->getPrevious();
		
		struct LiveVariables::GK gk;
		auto tmp = this->inOut.find(actual);
		if(tmp != this->inOut.end()){
			gk = tmp->second;

			while(aux != nullptr && aux != end){
				Instruction *prev = aux->getPrevious();

				Set<Variable>::iterator tmpIt = gk.gains.begin();
				std::cout << "Variables vives per ["<< aux->toString() <<"]: ";
				while(tmpIt < gk.gains.end()){
					std::cout << (*tmpIt)->getNom() << ", ";
					tmpIt++;
				}
				std::cout << std::endl;


				switch(aux->getType()){
					case Instruction::Type::ASSIGNMENT:
					{
						AssignmentInstruction *aInst = (AssignmentInstruction *) actual;
						break;
					}

					case Instruction::Type::ARITHMETIC:
					{
						ArithmeticInstruction *aInst = (ArithmeticInstruction *) actual;
						if(!gk.gains.contains(aInst->getDesti())){
							code->remove(aInst);
							canvis = true;
						}

						break;
					}

					default:
						// és possible que el valor d'una crida a un subprograma
						// no s'utilitzi, però eliminar la crida suposaria
						// no invocar un subprograma, que pot modificar altres variables
						break;
				}

				aux = prev;
			}
		}

		actual = actual->getNext();
	}

	return canvis;
}

/**
 * Afegeix una variable al mapping si aquesta no hi és
 */
void addIfNotExists(std::map<Variable *, bool> &map, Variable *var)
{
	auto v = map.find(var);
	if(v == map.end()){
		map.emplace(var, true);
	}
}