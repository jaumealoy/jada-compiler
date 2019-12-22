#include "SimbolPrograma.h"

void SimbolPrograma::make(SimbolDeclList declList){
        std::cout << "Programa trobat" << std::endl;

        if(!declList.getTeMain()){
            std::cout << "Error: no s'ha trobat un procediment main!" << std::endl;
        }
    }

void SimbolPrograma::toDotFile(){

}

SimbolPrograma::SimbolPrograma() : Simbol() {}
SimbolPrograma::~SimbolPrograma(){}