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

void TaulaVariables::Iterator::first() {
    this->index = 0;
}

void TaulaVariables::Iterator::next() {
    this->index += 1;
    this->declaracio = this->tv->tVariables[this->index].declaracio;
}

bool TaulaVariables::Iterator::isValid() {
    return this->declaracio != nullptr;
}

Descripcio * TaulaVariables::Iterator::get() {
    return this->declaracio;
}

int TaulaVariables::Iterator::getNV() {
    return this->index;
}
