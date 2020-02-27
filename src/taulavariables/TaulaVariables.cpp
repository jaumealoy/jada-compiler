#include "TaulaVariables.h"

//#include <iostream>, <fstream> ?

TaulaVariables::TaulaVariables() {
    //Inicializar la tabla
    this->init;
}

TaulaVariables::~TaulaVariables(){}

void TaulaVariables::init() {
    //Recorrer la tabla poniendo valores nulos
    for (int i = 0; i < MAX_VAR; i++) {
        this->tVariables[i].numPrograma = -1;
        this->tVariables[i].numVariable = -1;
    }

}

void TaulaVariables::Iterator::firts(int nv) {
    
}

void TaulaVariables::Iterator::next() {
    
}

bool TaulaVariables::Iterator::isValid() {
    
}

Descripcio TaulaVariables::Iterator::get() {
    
}

int TaulaVariables::Iterator::getNV() {
    
}
