#ifndef _H_DRIVER
#define _H_DRIVER

#include "Lexic.h"
#include "Syntax.tab.hpp"
#include "taulasimbols/TaulaSimbols.h"
#include <fstream>
#include <exception>
#include "Errors.h"

class Simbol;

using namespace yy;

class Driver{
private:
    Lexic *scanner;
    Syntax *parser;

    // fitxers per guardar outputs del compilador
    std::fstream treeFile;
    std::fstream tokensFile;

    // per comprovar si s'ha produït qualque error en la compilació
    bool exit;

public:
    Driver(char *filename);
    ~Driver();

    void parse();

    TaulaSimbols ts;

    void error(std::string msg);
    void error(std::string msg, bool atura);

    // Per guardar l'arbre sintàctic
    void writeToTree(std::string data);
    void writeToTree(Simbol *s, std::string data);
    std::string addTreeChild(Simbol *s, std::string data);

    void closeFiles();

    bool exitosa();
};
#endif