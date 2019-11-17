%{
// Codi en C/C++
#include <stdio.h>
#include <iostream>
#include <fstream>
#include "Lexic.h"

using namespace std;
%}

%option noyywrap 
%option yyclass="Lexic"

id  [A-Za-z_][A-Za-z0-9_]*
begin_bloc begin
end_bloc end
colon :
semicolon ;
coma ,
%%

{id} { 
	//cout << "Identificador: " << this->YYText() << endl;
	return TokenType::TK_ID; 
}

<<EOF>> {
    return TokenType::TK_EOF;
}

%%
// Codi que inclourà l'arxiu, en concret, el body de les funcions
Lexic::Lexic(char * filename)
	: yyFlexLexer()
{
	// obrir l'arxiu
	try{
		ifstream *in = new ifstream(filename);
		
		// indicar a FlexLexer d'on ha de llegir
		this->switch_streams(in);
	}catch(std::ifstream::failure e){
		cerr << "Error processant el fitxer d'entrada " << endl;
        cerr << e.what() << endl;
	}
}

Lexic::~Lexic(){

}

TokenType Lexic::getToken(){
    return (TokenType) this->yylex();
}