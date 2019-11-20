%{
// Codi en C/C++
#include <stdio.h>
#include <iostream>
#include <fstream>
#include "Lexic.h"

using namespace std;
using token = yy::Syntax::token;

%}

%option noyywrap 
%option yyclass="Lexic"

id  [A-Za-z_][A-Za-z0-9_]*
begin_bloc begin
end_bloc end
colon :
semicolon ;
coma ,
function func
procedure proc
left_paran \(
right_paran \)

new_line ['\n', '\r', '\r\n']
blank [' '|'\t']+

%%
{begin_bloc} { return token::TBEGIN; }
{end_bloc} { return token::TEND; }
{function} { return token::FUNC; }
{procedure} { return token::PROC; }
{colon} { return token::COLON; }
{semicolon} { return token::SEMICOLON; }
{coma} { 
	cout << "Coma" << endl;
	return token::COMA; }
{left_paran} { return token::LEFTPARAN; }
{right_paran} { return token::RIGHTPARAN; }
{id} { 
	cout << "Identificador: " << this->YYText() << endl;
	return token::ID; 
}
{new_line} { 
	// TODO: sumar linia, reiniciar columnes 
}
{blank} { 
	// TODO: sumar columnes 
}

<<EOF>> {
	cout << "End of file" << endl;
	return token::ENDFILE;
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

yy::Syntax::token_type Lexic::getToken(yy::Syntax::semantic_type *yylval, yy::location * l){
	return (yy::Syntax::token_type) this->yylex();
}