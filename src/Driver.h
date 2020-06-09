#ifndef _H_DRIVER
#define _H_DRIVER

#include "Lexic.h"
#include "Syntax.tab.hpp"
#include "taulasimbols/TaulaSimbols.h"
#include "code/CodeGeneration.h"
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
    std::fstream errorsFile;

    // per comprovar si s'ha produït qualque error en la compilació
    bool exit;

	// mode debug
	bool debug;

	// inicialització de les funcions pròpies del llenguatge
	void initPrintInt();
	void initReadInt();

	void initPrintChar();
	void initReadChar();

	void initPrint();
	void initRead();

	void initRandom();

public:
    class Error : public std::exception {};

    Driver(char *filename, bool debugMode);
    ~Driver();

    void parse();

	// anàlisi semàntica
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

	// generació de codi
	CodeGeneration code;
	bool isDebug();

    void closeFiles();

    bool exitosa();
};
#endif