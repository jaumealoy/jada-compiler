#include "CondJumpInstruction.h"
#include "GoToInstruction.h"
#include "AssignmentInstruction.h"
#include "../CodeGeneration.h"

CondJumpInstruction::CondJumpInstruction(Operator op, Variable *e1, Variable *e2, Label *l) 
	: Instruction(Instruction::Type::CONDJUMP), invertit(false)
{
	// e1 op e2
	this->op = op;
	this->e1 = e1;
	this->e2 = e2;

	// etiqueta de salt si e1 op e2 és cert
	this->l = l;
}

CondJumpInstruction::~CondJumpInstruction(){}

std::string CondJumpInstruction::toString() {
	std::string opString;
	switch (this->op)
	{
		case EQ:
			opString = "==";
			break;
		case NEQ:
			opString = "!=";
			break;
		case LTE:
			opString = "<=";
			break;
		case LT:
			opString = "<";
			break;
		case GTE:
			opString = ">=";
			break;
		case GT:
			opString = ">";
			break;
		default:
			break;
	}

	return "if " + this->e1->getNom() + " " + opString + " " + this->e2->getNom() +" then goto " + this->l->toString();
}

/**
 * Indica quina és l'etiqueta del salt i la marca com utilitzada
 */
void CondJumpInstruction::setLabel(Label *l){
	this->l = l;

	if(this->l != nullptr){
		this->l->markUsage();
	}
}

Label *CondJumpInstruction::getTarget(){
	return this->l;
}

void CondJumpInstruction::generateAssembly(CodeGeneration *code){
	// e1 OP e2	
	// carregar variables als registres
	if(this->e1->isConstant()){
		code->load(this->e1->getValor(), CodeGeneration::Register::A, this->e1->getTSB());
	}else{
		code->load(this, this->e1, CodeGeneration::Register::A);
	}

	if(this->e2->isConstant()){
		code->load(this->e2->getValor(), CodeGeneration::Register::D, this->e2->getTSB());
	}else{
		code->load(this, this->e2, CodeGeneration::Register::D);
	}

	// je = jump if equal (=)
	// jne = jump if not equal (!=)
	// jge = jump if greater or equal (<)
	// jg = jump if greater (<=)
	// jle = jump if less or equal (<)
	// jl = jump if less (>=)
	std::string inst[] = {"je", "jne", "jge", "jg", "jle", "jl"};

	// cmp e1, e2 === cmp %rax, %rdx
	code->output << "cmp" << CodeGeneration::getSizeTag(true, this->e1->getOcupacio()) << "\t";
	code->output << "%" << CodeGeneration::getRegister(CodeGeneration::Register::A, this->e1->getOcupacio());
	code->output << ", %" << CodeGeneration::getRegister(CodeGeneration::Register::D, this->e2->getOcupacio()) << std::endl;

	code->output << inst[this->op] << "\t" << this->l->toString();
}


/**
 * - Si els valors són constants es pot determinar si s'ha de fer el salt
 * - Si els valors són variables, es pot determinar el salt en cas d'igualtat o desigualtat
 * - Comprovar si canviant la condició es pot evitar un salt incondicional
 * - Salts consecutius
 */
bool CondJumpInstruction::optimize(CodeGeneration *code){
	if(this->e1->isConstant() && this->e2->isConstant()){
		// es pot determinar el salt en temps de compilació
		bool resultat = false;
		long a, b;

		// obtenir el valor d'a
		switch (TSB::sizeOf(this->e1->getTSB())) {
			case 1:
				a = (long) *this->e1->getValor()->get();
				break;

			case 4:
				a = (long) *(int *) this->e1->getValor()->get();
				break;

			case 8:
				a = *(long *) this->e1->getValor()->get();
				break;
		}

		// obtenir el valor de b
		switch (TSB::sizeOf(this->e2->getTSB())) {
			case 1:
				b = (long) *this->e2->getValor()->get();
				break;

			case 4:
				b = (long) *(int *) this->e2->getValor()->get();
				break;

			case 8:
				b = *(long *) this->e2->getValor()->get();
				break;
		}

		// calcular el resultat
		switch (this->op) {
			case Operator::EQ: resultat = a == b; break;
			case Operator::NEQ: resultat = a != b; break;
			case Operator::LT: resultat = a < b; break;
			case Operator::LTE: resultat = a <= b; break;
			case Operator::GT: resultat = a > b; break;
			case Operator::GTE: resultat = a >= b; break;
		}

		if(resultat){
			// s'ha de fer el salt
			Instruction *inst = code->addInstruction(new GoToInstruction(this->l));
			inst->setInvokingSubProgram(this->getInvokingSubProgram());
			code->move(inst, inst, this);
		}

		// eliminar aquesta instrucció
		code->remove(this);
		return true;
	}


	if(!this->e1->isConstant() && !this->e2->isConstant() && this->e1 == this->e2){
		if(this->op == CondJumpInstruction::Operator::EQ){
			// és una comparació d'igualtat i els dos operadors són la mateixa variable
			// és un cas de l'estil: a == a
			// es farà sempre el salt, es converteix en un incondicional

			Instruction *tmp = code->addInstruction(new GoToInstruction(this->l));
			tmp->setInvokingSubProgram(this->getInvokingSubProgram());
			code->move(tmp, tmp, this);
			code->remove(this);

			return true;
		}else if(this->op == CondJumpInstruction::Operator::NEQ){
			// és una comparació de desigualtat i són la mateixa variable
			// és un cas de l'estil: a != a
			// no es farà el salt, per tant es pot eliminar
			code->remove(this);
			return true;
		}
	}

	bool canvis = false;

	// comprovar canvi de condició: només és aplicable si la següent és un salt
	// incondicional
	// no s'ha de detectar el cas en què el goto va a la següent línia
	if(this->getNext() != nullptr && this->getNext()->getType() == Instruction::GOTO
		&& (Instruction *)((GoToInstruction *) this->getNext())->getTarget()->getTargetInstruction() != this->getNext()->getNext()
		&& !this->getNext()->isAddedAtOptimization()){

		if(!(this->getNext()->getNext() != nullptr 
			&& this->getNext()->getNext()->getType() == Instruction::GOTO
			&& ((GoToInstruction *) this->getNext()->getNext())->isAddedAtOptimization()))
		{
			invertit = true;

			this->l = ((GoToInstruction *) this->getNext())->getTarget();

			// invertir la condició
			Variable *tmp;

			CondJumpInstruction::Operator invers[] = {
				Operator::NEQ,	// EQ => !(a = b) === (a != b)
				Operator::EQ,	// NEQ => !(a != b) === (a = b)
				Operator::GT,	// LTE => !(a <= b) === (a > b)
				Operator::GTE,	// LT => !(a < b) === (a >= b)
				Operator::LT,	// GTE => !(a >= b) === (a < b)
				Operator::LTE	// GT => !(a > b) === (a <= b)
			};

			// canviar l'operador
			this->op = invers[this->op];
			
			// eliminar la següent instrucció
			code->remove(this->getNext());

			canvis = true;
		}

	}

	// canviar etiqueta de destí (en cas de concatenar salts incondicionals)
	Label *old = this->l;
	this->l = code->getTargetLabel(old);
	canvis = canvis || (old != this->l);

	// optimització assignacions de booleans
	if(this->e1->getTSB() == TipusSubjacentBasic::BOOLEAN && this->e2->getTSB() == TipusSubjacentBasic::BOOLEAN){
		// detectar l'estructura
		// if BOOL == BOOL goto E2
		// a = True
		// goto Ef

		if(this->getNext() != nullptr && this->getNext()->getType() == Instruction::Type::ASSIGNMENT){
			AssignmentInstruction *next1 = (AssignmentInstruction *) this->getNext();

			if(next1->getDesti()->getTSB() == TipusSubjacentBasic::BOOLEAN 
				&& next1->getOrigen() == nullptr){
				Instruction *next2 = next1->getNext();
				if(next2 != nullptr && next2->getType() == Instruction::Type::GOTO){
					if(next2->getNext() == (Instruction *) this->l->getTargetInstruction()){
						// comprovar que a continuació hi ha un a = False
						Instruction *next3 = next2->getNext()->getNext();
						if(next3 != nullptr && next3->getType() == Instruction::Type::ASSIGNMENT){
							AssignmentInstruction *next3A = (AssignmentInstruction *) next3;
							if(next3A->getDesti() == next1->getDesti()){
								Instruction *move1 = code->addInstruction(new AssignmentInstruction(
									((AssignmentInstruction *) next1)->getDesti(),
									this->e2
								));

								Instruction *move2 = code->addInstruction(new GoToInstruction(
									((GoToInstruction *) next2)->getTarget()
								));

								code->move(move1, move2, this->getPrevious());
								code->remove(this);

								return true;
							}
						}		
					}
				}
			}
		}
	}

	return canvis;
}

bool CondJumpInstruction::isInvertit(){
	return this->invertit;
}

Variable *CondJumpInstruction::getFirstOperand(){
	return this->e1;
}

Variable *CondJumpInstruction::getSecondOperand(){
	return this->e2;
}

void CondJumpInstruction::updateConstants(){
	this->e1->addUseList(this);
	this->e2->addUseList(this);
}