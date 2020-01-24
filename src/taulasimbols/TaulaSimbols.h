#ifndef _H_TAULASIMBOLS
#define _H_TAULASIMBOLS

#include <string>
#include <exception>

#include "Descripcio.h"
#include "DescripcioTipus.h"
#include "DescripcioFuncio.h"
#include "DescripcioProc.h"

#include "DescripcioArgument.h"
#include "DescripcioDimensio.h"
#include "DescripcioVar.h"
#include "DescripcioConstant.h"

#define MAX_PROFUNDITAT 20
#define MAX_SIMBOLS 1033

class TaulaSimbols{
private:
    const static int NUL = -1;

    struct Bloc{
        // nivell de profunditat de la símbol
        int nivellProfunditat;

        // llista del nivell de profunditat
        int nextNP;
        int primerNP;

        // índex de la taula d'expansió o següent
        int next;

        // identificador
        std::string identificador;

        // posició original dins la taula de descripció
        int original;

        // descripció
        Descripcio *declaracio;
    };
    
    // nivell de profunditat actual
    int nivellProfunditat;
    int indexLliure;
    struct Bloc tDescripcio[MAX_SIMBOLS];
    struct Bloc tExpansio[MAX_SIMBOLS * MAX_PROFUNDITAT];

    int darrerNivellProfunditat;

    // la posició i-èssima indica la darrera posició escrita a la taula
    // d'expansió, si el valor és NUL, no s'ha escrit
    int tAmbit[MAX_PROFUNDITAT];

    // taula de dispersió
    struct HashBloc{
        std::string id;
        int index;
    };
    struct HashBloc td[MAX_SIMBOLS];

    std::hash<std::string> hash;

    int getIndex(std::string id);


    // llista dels nivells de profunditat
    int nivellsProfunditat[MAX_PROFUNDITAT];

public:
    class NomExistent : public std::exception {};
    class NomNoExistent : public std::exception {};

    class Iterator {
    private:
        TaulaSimbols *ts;
        Descripcio::Tipus tipus;
        Descripcio *current;
        int index;

    public:
        Iterator();
        Iterator(TaulaSimbols *ts, Descripcio::Tipus tipus);        
        ~Iterator();

        void first(std::string id);
        void next();
        bool valid();
        Descripcio *get();
        std::string getId();
    };

    TaulaSimbols();
    ~TaulaSimbols();

    void buida();
    void entrarBloc();
    void surtirBloc();
    void posar(std::string id);
    void posar(std::string id, Descripcio *declaracio);
    void posar(std::string id, Descripcio *declaracio, bool protegit);
    Descripcio *consulta(std::string id);
    
    void print();
    void dump(std::string filename);
    
    // Gestió dels paràmetres de subprogrames
    void posarParam(std::string func, std::string nom, DescripcioArgument *arg);

    // Gestió de les dimensions d'un array
    void posarDimensio(std::string tipusArray, DescripcioDimensio *dim);

    // Per recòrrer dimensions o paràmetres
    Iterator getParametres();
    Iterator getDimensions();
};
#endif