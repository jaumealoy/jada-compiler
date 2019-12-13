#ifndef _H_SIMBOLPROCDECL
#define _H_SIMBOLPROCDECL

class SimbolProcDecl {
private:
    // per controlar si aquest procediment és un candidat vàlid per ser
    // un procediment principal
    bool esMain;

public:
    SimbolProcDecl(){
        this->esMain = false;
    }

    void setEsMain(bool main){
        this->esMain = main;
    }

    bool getEsMain(){
        return this->esMain;
    }
};

#endif