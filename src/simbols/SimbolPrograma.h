#ifndef _H_SIMBOLPROGRAMA
#define _H_SIMBOLPROGRAMA

class SimbolPrograma {
private:
    // determina si el programa té un programa principal o no
    bool teMain;

public:
    SimbolPrograma();
    ~SimbolPrograma();

    bool getTeMain();
    void setTeMain(bool teMain);
};

#endif