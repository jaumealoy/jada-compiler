#ifndef _H_DRIVER
#define _H_DRIVER

#include "Lexic.h"
#include "Syntax.tab.hpp"
#include "taulasimbols/TaulaSimbols.h"
#include <fstream>
#include <exception>

using namespace yy;

class Driver{
private:
    Lexic *scanner;
    Syntax *parser;

    // fitxers per guarddar l'arbre sintàctic
    std::fstream treeFile;

public:
    Driver(char *filename);
    ~Driver();

    void parse();

    TaulaSimbols ts;

    void error(std::string msg);
    void error(std::string msg, bool atura);

    // Per guardar l'arbre sintàctic
    void writeToTree(std::string data);
    void closeTreeFile();
};
#endif