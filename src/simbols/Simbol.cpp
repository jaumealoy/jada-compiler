#include "Simbol.h"

int Simbol::totalSimbols = 0;


Simbol::Simbol(){
    this->nodeId = Simbol::totalSimbols++;
    this->parentId = -1;
}

Simbol::~Simbol(){}