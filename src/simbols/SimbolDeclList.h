#ifndef _H_SIMBOLDECLLIST
#define _H_SIMBOLDECLLIST

class SimbolDeclList {
private:
    // per controlar que la llista de declaracion té un procediment
    bool teMain;

public:
    SimbolDeclList(){
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