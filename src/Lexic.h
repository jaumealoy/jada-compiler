#ifndef _H_LEXIC
#define _H_LEXIC

#include "Token.h"

#ifndef yyFlexLexer
#include "FlexLexer.h"
#endif

// Definir la classe de l'analitzador lèxic
class Lexic : public yyFlexLexer {
private:
	int currentLine;
	int currentColumn;

	int yylex(); // funció pròpia del Flex
public:
	Lexic(char *);
	~Lexic();

	TokenType getToken();	
};

#endif