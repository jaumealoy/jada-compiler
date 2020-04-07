#include "SubProgram.h"
#include "Variable.h"

SubProgram::SubProgram(int np, Label start, std::string id) {
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
}

SubProgram::~SubProgram() {};

void SubProgram::setNP(int np) {
    this->nivellProfunditat = np;
}

int SubProgram::getNivellProfunditat() {
	return this->nivellProfunditat;
}

int SubProgram::getOcupacioVariables() {
	int mod = (this->ocupacioVariables / 8 + 1) * 8 - this->ocupacioVariables;
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

	if(var->getTSB() == TipusSubjacentBasic::ARRAY){
		// és possible que tengui un espai extra
		this->currentOffsetVariables -= var->getOcupacioExtra();
	}
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

	int mod = (ocupacio / 8 + 1) * 8 - ocupacio;
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
	return this->start.toString();
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