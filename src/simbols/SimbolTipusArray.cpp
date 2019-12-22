#include "SimbolTipusArray.h"
#include "../Driver.h"


SimbolTipusArray::SimbolTipusArray() : Simbol(), dimensions() {}
SimbolTipusArray::~SimbolTipusArray() {}

void SimbolTipusArray::make(int dimensio){
    this->driver->ts.buida();
    this->dimensions.push_back(dimensio);
}

void SimbolTipusArray::make(std::string tipusBasic) {
        // Comprovar que tipusBasic està definit a la taula de símbols
        this->tipusBasic = tipusBasic;
        // Inserir l'array a la taula de símbols
    }

    void SimbolTipusArray::toDotFile(){}

std::string SimbolTipusArray::toString(){
    std::string tmp = "_" + this->tipusBasic + "_";
        
        int mida = (int) dimensions.size();
        for(int i = 0; i < mida; i++){
            tmp += std::to_string(dimensions[i]) + "_";
        }

        return tmp;
    }