#include "CodeGeneration.h"
#include "Label.h"
#include "instructions/GoToInstruction.h"
#include "instructions/CondJumpInstruction.h"
#include "instructions/AssignmentInstruction.h"
#include "instructions/ArithmeticInstruction.h"
#include "instructions/SkipInstruction.h"
#include <iostream>

CodeGeneration::CodeGeneration() : output("codi.asm") {
	this->first = nullptr;
	this->last = nullptr;

	this->variableCounter = 0;
	this->labelCounter = 0;
	this->subprogramCounter = 0;

	// inicialment no s'està dins cap subprograma
	// però es permeten variables globals, per simplificar el control
	// es crearà un subprograma que representa tot el subprograma
	this->nivellProfunditat = 0;
	Label *mStart = this->addLabel();
	SubProgram *global = new SubProgram(this->nivellProfunditat, mStart, "_start");
	this->subprogrames.push(global);
}

CodeGeneration::~CodeGeneration(){
	// eliminar totes les instruccions
	while(this->first != nullptr){
		this->last = this->first->getNext();
		delete this->first;
		this->first = this->last;
	}

	this->first = nullptr;
	this->last = nullptr;
}

/**
 * Afegeix una instrucció al final del codi generat
 */
Instruction * CodeGeneration::addInstruction(Instruction *inst){
	if(this->first == nullptr){
		// és la primera instrucció que es crea
		this->first = inst;
		this->last = inst;
	}else{
		// hi ha altres instruccions, s'insereix al final
		this->last->setNext(inst);
		inst->setPrevious(this->last);
		this->last = inst;
	}

	// indicar que aquesta instrucció es troba dins un determinat nivell
	inst->setInvokingSubProgram(this->subprogrames.top());

	return inst;
}

/**
 * Crea i retorna una nova etiqueta
 */
Label *CodeGeneration::addLabel(){
	return new Label(++this->labelCounter);
}

Label *CodeGeneration::addLabel(std::string name){
	return new Label(++this->labelCounter, name);
}

/**
 * Crea i retorna una nova variable, amb nom o sense
 */
Variable *CodeGeneration::addVariable(TipusSubjacentBasic tsb){
	return this->addVariable(tsb, false);
}

Variable *CodeGeneration::addVariable(TipusSubjacentBasic tsb, bool parameter){
	// el subprograma actual és
	SubProgram *actual = this->subprogrames.top();

	Variable *tmp = this->vars.add(
		new Variable(actual, ++this->variableCounter, parameter)
	);

	// indicar l'ocupació
	tmp->setOcupacio(tsb);

	return tmp;
}

Variable *CodeGeneration::addVariable(TipusSubjacentBasic tsb, std::string name){
	std::cout << "Afegint variable (o no) amb nom " << name << std::endl;
	return this->addVariable(tsb, name, false);
}

Variable *CodeGeneration::addVariable(TipusSubjacentBasic tsb, std::string name, bool parameter){
	// el subprograma actual és
	SubProgram *actual = this->subprogrames.top();

	Variable *tmp = this->vars.add(
		new Variable(actual, ++this->variableCounter, name, parameter)
	);

	// indicar l'ocupació
	tmp->setOcupacio(tsb);

	return tmp;
}

/**
 * Crea un subprograma a la generació de codi
 */
SubProgram *CodeGeneration::addSubProgram(std::string id, Label *label) {
	// el nivell d'aquest subprograma és l'actual
	SubProgram *programa = new SubProgram(this->nivellProfunditat + 1, label, id);
	this->programs.add(programa);
	return programa;
}

/**
 * L'acció d'entar dins un subprograma suposa que totes les variables
 * creades a continuació estaran definides dins aquest subprograma
 */
void CodeGeneration::enterSubProgram(SubProgram *subprogram) {
	this->subprogrames.push(subprogram);
	this->nivellProfunditat = subprogram->getNivellProfunditat();
}

/**
 * Recuperar el subprograma anterior.
 * En cas de no tenir cap subprograma es produirà un error
 */
void CodeGeneration::leaveSubProgram() {
	this->subprogrames.pop();
	this->nivellProfunditat = this->subprogrames.top()->getNivellProfunditat();
}

/**
 * Escriu el codi actual a un arxiu de text
 */
void CodeGeneration::writeToFile(std::ofstream &file){
	Instruction *act = this->first;
	while(act != nullptr){
		file << act->toString() << std::endl;
		act = act->getNext();
	}
}

/**
 * Generació de codi assemblador.
 * 1) generar les diferents seccions (.data, .bss i .text)
 * 1.1) .data són les variables inicialitzades, variables globals inicialitzades
 * 1.2) .bss són variables globals sense inicialitzar
 * 1.3) .text és el programa (subprogrames i instruccions)
 */
void CodeGeneration::generateAssembly() {
	// primer s'han d'actualitzar les taules (amb aquest ordre)
	this->updateSubProgramTable();
	this->updateVariableTable();

	// si s'ha arribat fins aquí, segur que la pila de subprogrames conté
	// el "subprograma" que s'ha creat artificialment
	SubProgram *start = this->subprogrames.top();

	this->output << ".global _start" << std::endl;

	// secció .data
	this->output << ".data" << std::endl;

	// secció .bss
	this->output << ".bss" << std::endl;

	// variables globals no inicialitzades
	// TODO: la inicialització de variables sempre es fa en temps d'execució
	for(int i = 0; i < this->vars.size(); i++){
		Variable *tmp = this->vars.get(i);
		if(tmp->getSubPrograma() != start) continue;
		
		this->output << "\t" << tmp->getAssemblyTag() + ":";
		this->output << "\t.fill\t" << tmp->getOcupacio() << ", 1, 0";
		this->output << std::endl;
	}
	
	this->output << ".text" << std::endl;
	this->output << "_start:" << std::endl;

	// ara es pot representar cada instrucció
	Instruction *act = this->first;
	while(act != nullptr){
		this->output << "/* " << act->toString() << " */" << std::endl;
		act->generateAssembly(this);
		this->output << std::endl;
		act = act->getNext();
	}

	// indicar fi del programa
	this->output << "movq\t$1, %rax" << std::endl;
	this->output << "movq\t$0, %rbx" << std::endl;
	this->output << "int\t$0x80" << std::endl;
	
	// TODO: implementar els subprogrames propis en C3A?
	// incloure els subprogrames propis
	std::ifstream printIntCode("programs/printInt.asm");
	std::string line;
	while(std::getline(printIntCode, line)){
		this->output << line << std::endl;
	}


	std::cout << "Final assembly" << std::endl;
}

/**
 * Substitueix l'etiqueta dels salts (condicionals o no) per l'etiqueta
 * passada per paràmetre
 */
void CodeGeneration::backpatch(Label *e, Instruction *v) {
	switch (v->getType()) {
		case Instruction::Type::GOTO: 
			((GoToInstruction *) v)->setLabel(e); 
			break;

		case Instruction::Type::CONDJUMP:
			((CondJumpInstruction *) v)->setLabel(e);
			break;
	}
}

void CodeGeneration::backpatch(Label *e, std::vector<Instruction *> v) {
	for(int i = 0; i < v.size(); i++) {
		this->backpatch(e, v[i]);
	}
}

void CodeGeneration::backpatch(Label *e, std::list<Instruction *> v) {
	std::list<Instruction *>::iterator it = v.begin();
	while(it != v.end()){
		this->backpatch(e, *it);
		it++;
	}
}


/**
 * Mou les instruccions situades entre start i end (inloses) després d'after
 * start: és la primera instrucció a partir de la qual es vol moure
 * end: és la darrera instrucció que es mourà
 * after: allà on s'inserirà el bloc start-end
 */
void CodeGeneration::move(Instruction *start, Instruction *end, Instruction *after){
	Instruction *aux = start;
	Instruction *tmp;
	while(aux != end){
		tmp = aux->getNext();
		this->move(aux, after);
		after = aux;
		aux = tmp;
	}

	this->move(end, after);
}


/**
 * Situa una instrucció inst després d'after
 * Precondicions: inst != after, inst != null, after != null
 */
void CodeGeneration::move(Instruction *inst, Instruction *after){
	// elimina la instrucció
	this->remove(inst);

	// afegir-la després d'after
	if(after == this->last){
		this->last = inst;
		inst->setNext(nullptr);
	}

	inst->setPrevious(after);
	inst->setNext(after->getNext());
	after->setNext(inst);
}


/**
 * Elimina una instrucció de la llista d'instruccions
 */
void CodeGeneration::remove(Instruction *inst){
	if(inst == this->first){
		// eliminar la primera instrucció de la llista
		this->first = inst->getNext();
		
		if(this->first != nullptr){
			this->first->setPrevious(nullptr);
		}
	}else{
		// no és el primer element
		// inst.prev != null
		inst->getPrevious()->setNext(inst->getNext());

		if(inst->getNext() != nullptr){
			inst->getNext()->setPrevious(inst->getPrevious());
		}
	}

	if(inst == this->last){
		// és el darrer element
		this->last = inst->getPrevious();
	}

	//delete inst;
}

/**
 * Unió de conjunts
 */
std::vector<Instruction *> CodeGeneration::concat(std::vector<Instruction *> list1, std::vector<Instruction *> list2){
	std::vector<Instruction *> tmp;
	tmp.reserve(list1.size() + list2.size());

	for(int i = 0; i < list1.size(); i++){
		tmp.push_back(list1[i]);
	}

	for(int i = 0; i < list2.size(); i++){
		tmp.push_back(list2[i]);
	}

	return tmp;
}

std::list<Instruction *> CodeGeneration::concat(std::list<Instruction *> list1, std::list<Instruction *> list2){
	std::list<Instruction *> tmp;

	std::list<Instruction *>::iterator it = list1.begin();
	while(it != list1.end()){
		tmp.push_back(*it);
		it++;
	}

	it = list2.begin();
	while(it != list2.end()){
		tmp.push_back(*it);
		it++;
	}

	return tmp;
}

/**
 * Converteix un conjunt vector a una estructura llista
 */
std::list<Instruction *> CodeGeneration::convert(std::vector<Instruction *> list) {
	std::list<Instruction *> tmp;

	std::vector<Instruction *>::iterator it = list.begin();
	while(it != list.end()){
		tmp.push_back(*it);
		it++;
	}

	return tmp;
}

/**
 * Actualització de la taula de variables.
 * Per cada variable, s'ha d'actualitzar el seu offset tenint en compte
 * la mida del subprograma.
 * 
 * Les variables locals comencen a l'offset = 0
 */
void CodeGeneration::updateVariableTable() {
	// totes les variables tenen un subprograma vàlid associat
	for(int i = 0; i < this->vars.size(); i++){
		Variable *actual = this->vars.get(i);
		SubProgram *subprograma = actual->getSubPrograma();

		if(subprograma == nullptr) {
			std::cerr << "Variable " << actual->getNom() << " no té subprograma" << std::endl;
			continue;
		}

		if(actual->isConstant()){
			// els valors constants no tenen memòria reservada
			continue;
		}

		// els paràmetres ja tenen els offsets calculats quan es defineix el subprograma
		if(!actual->isParameter()){
			int currentOffset = subprograma->getOcupacioVariables();
			actual->setOffset(currentOffset);

			subprograma->addVariable(actual);
		}

		std::cout << "Variable " << actual->getNom() << " del subprograma " << subprograma->getNom() << " té mida " << actual->getOcupacio() << " offset: " << actual->getOffset() << std::endl;		
	}
}

/**
 * Actualització de la taula de subprogrames
 * Tots els subprogrames tenen una ocupació de 0
 */
void CodeGeneration::updateSubProgramTable() {
	for(int i = 0; i < this->programs.size(); i++) {
		// reiniciar el comptador de l'ocupació de variables
		this->programs.get(i)->resetOffsets();
	}
}

/**
 * Retorna el sufix o l'etiqueta d'una determinada mida
 */
std::string CodeGeneration::getSizeTag(bool instructionTag, int mida) {
	std::string tmp = "";

	std::string instructionTags[] = {"b", "l", "q"};
	std::string dataTags[] = {"byte", "long", "quad"};

	switch (mida) {
		case 1: 
			if (instructionTag) {
				tmp = "b";
			} else {
				tmp = "byte";
			}

			break;
			
		case 4:
			if (instructionTag) {
				tmp = "l";
			} else {
				tmp = "long";
			}

			break;

		case 8:
			if (instructionTag) {
				tmp = "q";
			} else {
				tmp = "quad";
			}

			break;
	}

	return tmp;
}

std::string CodeGeneration::getSizeTag(bool instructionTag, TipusSubjacentBasic tsb) {
	return getSizeTag(instructionTag, TSB::sizeOf(tsb));
}

std::string CodeGeneration::getRegister(Register reg, int size){
	std::string tmp;

	// registres d'1 byte
	std::string byteRegister[] = {
		"al", "bl", "cl", "dl", 
		"sil", "dil", "bpl", "spl", 
		"r8b", "r9b", "r10b", "r11b",
		"r12b", "r13b", "r14b", "r15b"
	};

	// registres de 4 bytes
	std::string longRegister[] = {
		"eax", "ebx", "ecx", "edx", 
		"esi", "edi", "ebp", "esp", 
		"r8d", "r9d", "r10d", "r11d",
		"r12d", "r13d", "r14d", "r15d"
	};

	// registres de 8 bytes
	std::string quadRegister[] = {
		"rax", "rbx", "rcx", "rdx", 
		"rsi", "rdi", "rbp", "rsp", 
		"r8", "r9", "r10", "r11",
		"r12", "r13", "r14", "r15"
	};

	std::string *array;
	switch (size) {
		case 1:
			array = byteRegister;
			break;

		case 4:
			array = longRegister;
			break;

		case 8:
			array = quadRegister;
			break;

		default:
			array = longRegister;
	}

	tmp = array[reg];
	return tmp;
}


/**
 * Macro per carregar una variable a un registre
 */
void CodeGeneration::load(Instruction *inst, Variable *var, CodeGeneration::Register reg){
	this->output << "mov" << CodeGeneration::getSizeTag(true, var->getOcupacio()) << "\t";
	this->output << inst->getAssemblyVariable(var) << ", %";
	this->output << CodeGeneration::getRegister(reg, var->getOcupacio()) << std::endl;
}

/**
 * Carregar un valor constant a un registre
 */
void CodeGeneration::load(std::shared_ptr<ValueContainer> valor, 
	CodeGeneration::Register reg, TipusSubjacentBasic tsb)
{

	int mida = valor->getSize();
	long valorConstant = 0;

	switch (mida) {
		case 1:
			valorConstant = (long) *valor->get();
			break;

		case 4:
			valorConstant = (long) *(int *) valor->get();
			break;

		case 8:
			valorConstant = *(long *) valor->get();
			break;
	}

	this->output << "mov" << CodeGeneration::getSizeTag(true, TSB::sizeOf(tsb)) << "\t";
	this->output << "$" << valorConstant << ", %";
	this->output << CodeGeneration::getRegister(reg, TSB::sizeOf(tsb)) << std::endl;
}

/**
 * Macro per carregar una variable a un registre
 */
void CodeGeneration::store(Instruction *inst, CodeGeneration::Register reg, Variable *var){
	this->output << "mov" << CodeGeneration::getSizeTag(true, var->getOcupacio()) << "\t";
	this->output << "%" << CodeGeneration::getRegister(reg, var->getOcupacio()) << ", ";
	this->output << inst->getAssemblyVariable(var) << std::endl;
}

/**
 * Aplica les optimitzacions sobre el codi intermedi
 */
void CodeGeneration::optimize(){
	bool canvis = true;
	while(canvis){
		canvis = false;

		// identificar constants
		this->updateConstants();

		// eliminar instruccions d'assignació de constants
		// TODO

		Instruction *tmp = this->first;
		while(tmp != nullptr){
			Instruction *next = tmp->getNext();

			switch (tmp->getType()) {
				case Instruction::Type::ASSIGNMENT:
					canvis = ((AssignmentInstruction *) tmp)->optimize(this) || canvis;
					break;

				case Instruction::Type::ARITHMETIC:
					canvis = ((ArithmeticInstruction *) tmp)->optimize(this) || canvis;
					break;

				case Instruction::Type::GOTO:
					canvis = ((GoToInstruction *) tmp)->optimize(this) || canvis;
					break;

				case Instruction::Type::CONDJUMP: {
					// l'optimització d'un salt condicional pot provocar l'eliminació de
					// la següent instrucció si és un salt incondicional
					bool nextGoTo = false;
					Instruction *safeNext = nullptr;
					if(next != nullptr && next->getType() == Instruction::Type::GOTO){
						std::cout << "Següent instrucció a salt condicional és GOTO" << std::endl;
						nextGoTo = true;
						safeNext = next->getNext();
					}
	
					bool canvisLocals = ((CondJumpInstruction *) tmp)->optimize(this);

					if(canvisLocals && nextGoTo){
						// és possible que s'hagi eliminat el next
						next = safeNext;
						std::cout << "Salt condicional canviant futures instruccions" << std::endl;
					}

					canvis = canvisLocals || canvis;
				}
				break;

				default:
					canvis = canvis || false;
			}
			tmp = next;
		}


		for(int i = 0; i < this->vars.size(); i++){
			if(this->vars.get(i)->isConstant()){
				std::cout << "Bloquejant constant " << i << std::endl;
				this->vars.get(i)->lockConstant();
			}
		}

		std::cout << "acabat instruccions, canvis = " << canvis << std::endl;
	}
}

/**
 * Determina quines variables són constants
 * - Indica el valor de la variable
 * - Indica la instrucció en què s'inicialitza la constant
 */
void CodeGeneration::updateConstants(){
	// indicar que totes les variables són possibles constants
	for(int i = 0; i < this->vars.size(); i++){
		this->vars.get(i)->resetConstant();
	}

	// les instruccions que poden determinar si una variable
	// és una constant o no són les aritmètiques i les d'assignació

	Instruction *inst = this->first;
	while(inst != nullptr){
		switch (inst->getType()) {
			case Instruction::Type::ASSIGNMENT:
				((AssignmentInstruction *) inst)->updateConstants();
				break;

			case Instruction::Type::ARITHMETIC:
				((ArithmeticInstruction *) inst)->updateConstants();
				break;
		}
		inst = inst->getNext();
	}

	for(int i = 0; i < this->vars.size(); i++){
		if(this->vars.get(i)->isConstant()){
			std::cout << "Variable " << i << " value = " << this->vars.get(i)->getNom() << " és una constant" <<std::endl;
		}
	}

}

/**
 * Obté l'etiqueta final d'una sèrie de sals incondicionals
 */
Label *CodeGeneration::getTargetLabel(Label *label){
	Instruction *inst = label->getTargetInstruction()->getNext();
	
	while(inst != nullptr && inst->getType() == Instruction::Type::GOTO){
		label = ((GoToInstruction *) inst)->getTarget();
		inst = label->getTargetInstruction()->getNext();
	}

	return label;
}