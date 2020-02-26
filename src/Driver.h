#ifndef _H_DRIVER
#define _H_DRIVER

#include "Lexic.h"
#include "Syntax.tab.hpp"
#include "taulasimbols/TaulaSimbols.h"
#include <fstream>
#include <exception>
#include "Errors.h"
#include "tresa.h"

class Simbol;

using namespace yy;

class Driver{
private:
    Lexic *scanner;
    Syntax *parser;

    // fitxers per guardar outputs del compilador
    std::fstream treeFile;
    std::fstream tokensFile;
    std::fstream errorsFile;
    std::fstream tresaFile;

    int cont3a = 0;
    tresa Codi3a[40];

    // per comprovar si s'ha produït qualque error en la compilació
    bool exit;

public:
    class Error : public std::exception {};

    Driver(char *filename);
    ~Driver();

    void parse();

    TaulaSimbols ts;

    void error(std::string msg);
    void error(std::string msg, bool atura);
    void error(std::string msg, yy::location pos, bool atura);

    // obtenir la posició actual
    yy::location getLocation();

    // Per guardar l'arbre sintàctic
    void writeToTree(std::string data);
    void writeToTree(Simbol *s, std::string data);
    std::string addTreeChild(Simbol *s, std::string data);

    //Per afegir codi 3@
    void add3a(TATIPUS, int op1, int op2, int op3);

    void closeFiles();

    bool exitosa();
};
#endif