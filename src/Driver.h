#ifndef _H_DRIVER
#define _H_DRIVER

#include "Lexic.h"
#include "Syntax.tab.hpp"

#include "taulasimbols/TaulaSimbols.h"


using namespace yy;

class Driver{
private:
    Lexic *scanner;
    Syntax *parser;

public:
    Driver(char *filename);
    ~Driver();

    void parse();

    TaulaSimbols ts;
};
#endif