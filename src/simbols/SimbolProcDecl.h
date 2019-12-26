#ifndef _H_SIMBOLPROCDECL
#define _H_SIMBOLPROCDECL

#include "Simbol.h"
#include "SimbolProcCap.h"
#include "SimbolBloc.h"

class SimbolProcDecl : Simbol {
private:
    // per controlar si aquest procediment és un candidat vàlid per ser
    // un procediment principal
    bool esMain;

public:
    SimbolProcDecl() : Simbol(){
        this->esMain = false;
    }

    ~SimbolProcDecl() {
        
    }

    void setEsMain(bool main){
        this->esMain = main;
    }

    bool getEsMain(){
        return this->esMain;
    }

    void make(Driver *driver, SimbolProcCap cap, SimbolBloc bloc, std::string nom);
};

#endif