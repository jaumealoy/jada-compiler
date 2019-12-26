#include "SimbolPrograma.h"

void SimbolPrograma::make(Driver *driver, SimbolDeclList declList){
    std::cout << "Programa trobat" << std::endl;

    if(!declList.getTeMain()){
        std::cout << "Error: no s'ha trobat un procediment main!" << std::endl;
    }

    // representar el node a l'arbre
    this->fills.push_back(std::to_string(declList.getNodeId()));
    this->toDotFile(driver);
}

void SimbolPrograma::toDotFile(Driver *driver){
    Simbol::toDotFile(driver);

    // afegir fill declList

}

SimbolPrograma::SimbolPrograma() : Simbol("Programa") {}
SimbolPrograma::~SimbolPrograma(){}