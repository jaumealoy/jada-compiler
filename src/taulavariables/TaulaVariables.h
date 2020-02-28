#ifndef _H_TAULAVARIABLES
#define _H_TAULAVARIABLES

#define MAX_VAR 1024

#include "Descripcio.h"

class TaulaVariables{
private:

    struct Entrada {

        int numPrograma;

        int numVariable;

        //Para indicar el próximo 
        int nextNV;

        Descripcio *declaracio;

    };

    struct Entrada tVariables[MAX_VAR];
public:


    TaulaVariables();
    ~TaulaVariables();

    class Iterator {
    private:
        TaulaVariables *tv;
        int index;
        Descripcio *declaracio;

    public:
        Iterator();
        ~Iterator();

        void first();
        void next();
        bool isValid();
        Descripcio *get();
        int getNV();
    };

    void init();

};
#endif