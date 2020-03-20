#include "ControlInstruccions.h"

bool ControlInstruccions::conteBreak(){
    return this->_conteBreak;
}

std::vector<struct ControlInstruccions::ReturnData> ControlInstruccions::getReturns() {
    return this->_returns;
}

/**
 * Comprova si existeix un o més returns
 */
bool ControlInstruccions::conteReturn() {
    return this->_returns.size() > 0;
}

/**
 * Propaga els valors del break i return a l'objecte actual
 */
void ControlInstruccions::propaga(ControlInstruccions obj){
    this->_conteBreak = obj._conteBreak;
    this->_returns = obj._returns;
}

void ControlInstruccions::propaga(ControlInstruccions &a, ControlInstruccions &b){
    // Si un dels dos té break, aquest també
    this->_conteBreak = (a._conteBreak || b._conteBreak) ? true : false;

    // Afegir els returs de a i b
    this->_returns = a._returns;
    for(int i = b._returns.size() - 1; i >= 0; i--) {
        this->_returns.push_back(b._returns[i]);
    }
}

/**
 * Obtenir les instruccions que poden necessitar un backpatching
 */
std::vector<Instruction *> ControlInstruccions::getSeg(){
	return this->seg;
}