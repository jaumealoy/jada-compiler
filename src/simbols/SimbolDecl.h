#ifndef _H_SIMBOLDECL
#define _H_SIMBOLDECL

#include "Simbol.h"

class SimbolDecl : public Simbol {
private:
    // per controlar que la declaracio té un procediment main
    bool teMain;

public:
    SimbolDecl(){
        this->teMain = false;
    }

    void setTeMain(bool main){
        this->teMain = main;
    }

    bool getTeMain(){
        return this->teMain;
    }
};

#endif