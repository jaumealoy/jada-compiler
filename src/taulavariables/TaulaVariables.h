#ifndef _H_TAULAVARIABLES
#define _H_TAULAVARIABLES

#define MAX_VAR 1024

#include "Descripcio.h"

class TaulaVariables{
private:

    struct Entrada {

        int numPrograma;

        
        //Podría ser redundante o innecesario tener el nv
        //porque coincidiría con el índice de la tabla...
        int numVariable;

        Descripcio *declaracio;

    };

    //Numero de variable siguiente a insertar
    int nv;

    struct Entrada tVariables[MAX_VAR];
public:


    TaulaVariables();
    ~TaulaVariables();

    class Iterator {
    private:
        TaulaVariables *tv;
        //Índice actual del iterador sobre la tv
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
    void buida();
    void posar(Descripcio *declaracion, int np);
    //Jaume me dijo que no querríamos descripciones pero por si acaso..
    Descripcio *consulta(int nv);

};
#endif