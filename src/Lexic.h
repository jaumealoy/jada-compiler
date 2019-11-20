#ifndef _H_LEXIC
#define _H_LEXIC

#include "Token.h"

#ifndef yyFlexLexer
#include "FlexLexer.h"
#endif

#include "Syntax.tab.hpp"
#include "location.hh"

// Definir la classe de l'analitzador lèxic
class Lexic : public yyFlexLexer {
private:
	int currentLine;
	int currentColumn;

	int yylex(); // funció pròpia del Flex
public:
	Lexic(char *);
	~Lexic();

	yy::Syntax::token_type getToken(yy::Syntax::semantic_type *yylval, yy::location *);	
};
#endif