#include "ControlInstruccions.h"

bool ControlInstruccions::conteBreak(){
    return this->_conteBreak;
}

bool ControlInstruccions::conteReturn(){
    return this->_conteReturn;
}

std::string ControlInstruccions::getTipusReturn(){
    return this->tipusReturn;
}

TSB::TipusSubjacentBasic ControlInstruccions::getTSBReturn(){
    return this->tsbReturn;
}

/**
 * Propaga els valors del break i return a l'objecte actual
 */
void ControlInstruccions::propaga(ControlInstruccions obj){
    this->_conteBreak = obj._conteBreak;

    this->_conteReturn = obj._conteReturn;
    this->tipusReturn = obj.tipusReturn;
    this->tsbReturn = obj.tsbReturn;
}


void ControlInstruccions::propaga(ControlInstruccions &a, ControlInstruccions &b){
    // Si un dels dos té break, aquest també
    this->_conteBreak = (a._conteBreak || b._conteBreak) ? true : false;

    // TODO: decidir que passa amb els returns
}
