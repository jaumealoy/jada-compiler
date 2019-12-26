#ifndef _H_TAULASIMBOLS
#define _H_TAULASIMBOLS

#include <string>
#include <exception>

#include "Descripcio.h"
#include "DescripcioTipus.h"
#include "DescripcioArgument.h"
#include "DescripcioFuncio.h"
#include "DescripcioProc.h"


#define MAX_PROFUNDITAT 20
#define MAX_SIMBOLS 1033

class TaulaSimbols{
private:
    const static int NUL = -1;

    struct Bloc{
        // nivell de profunditat de la símbol
        int nivellProfunditat;

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


public:
    class NomExistent : public std::exception {};
    class NomNoExistent : public std::exception {};

    TaulaSimbols();
    ~TaulaSimbols();

    void buida();
    void entrarBloc();
    void surtirBloc();
    void posar(char *id);
    void posar(std::string id);
    void posar(std::string id, Descripcio *declaracio);
    void actualitza(std::string id, Descripcio *descripcio);
    void print();
    void posarParam(std::string func, std::string nom, DescripcioArgument *arg);

    Descripcio * consulta(std::string id);
};
#endif