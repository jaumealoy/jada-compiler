#ifndef _H_DRIVER
#define _H_DRIVER

#include "Lexic.h"
#include "Syntax.tab.hpp"

using namespace yy;

class Driver{
private:
    Lexic *scanner;
    Syntax *parser;

    Node_Program *root;
public:
    Driver(char *filename);
    ~Driver();

    Node_Program * parse();

    void setRoot(Node_Program *root);
};
#endif