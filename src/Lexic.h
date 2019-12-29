#ifndef _H_LEXIC
#define _H_LEXIC

#include "Token.h"

#ifndef yyFlexLexer
#include "FlexLexer.h"
#endif

#include "Syntax.tab.hpp"
#include "location.hh"

#include <fstream>


// Definir la classe de l'analitzador lèxic
class Lexic : public yyFlexLexer {
private:
	yy::location *loc;

	std::fstream tokensFile;

	int yylex(yy::Syntax::semantic_type * const lval, yy::Syntax::location_type *location); // funció pròpia del Flex
public:
	Lexic(char *, std::fstream &);
	~Lexic();

	yy::location *getLocation();
	int getToken(yy::Syntax::semantic_type *yylval, yy::location *);	
};
#endif