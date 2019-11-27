%{
// Codi en C/C++
#include <stdio.h>
#include <iostream>
#include <fstream>
#include "Lexic.h"
#include "strings/StringBuffer.h"

#undef  YY_DECL
#define YY_DECL int Lexic::yylex( yy::Syntax::semantic_type * const yylval, yy::Syntax::location_type *location )

using namespace std;
using token = yy::Syntax::token;

StringBuffer strBuilder;

%}

%option debug
%option noyywrap 
%option yyclass="Lexic"

/* Literals */
id  [A-Za-z_][A-Za-z0-9_]*
integer [0-9]+

/* Operadors */
op_gt >
op_gte >=
op_lt <
op_lte <=
op_eq ==
op_neq !=

op_add +
op_minus -
op_div /
op_mul *

/* Símbols */
sym_eq =
sym_squote \'
sym_dquote \"
sym_lparan \(
sym_rparan \)
sym_colon :
sym_semicolon ;
sym_coma ,

/* Paraules reservades */
r_if if
r_else else
r_switch switch
r_case case
r_default default
r_break break
r_begin begin
r_end end
r_do do
r_function func
r_procedure proc
r_return return

/* Altres */
new_line ['\n', '\r', '\r\n']
blank [' '|'\t']+

/* Modes de scan */
%x STRING_LITERAL
%x CHAR_LITERAL	

%%
{sym_eq}		{ return token::EQ; }
{sym_squote}	{ return token::SQUOTE; }
{sym_dquote}	{ 
	strBuilder.clear();
	BEGIN(STRING_LITERAL);
}
{sym_lparan}	{ return token::LEFTPARAN; }
{sym_rparan}	{ return token::RIGHTPARAN; }
{sym_colon}		{ return token::COLON; }
{sym_semicolon}	{ return token::SEMICOLON; }
{sym_coma}		{ return token::COMA; }

{r_if}			{ return token::IF; }
{r_else}		{ return token::ELSE; }
{r_switch}		{ return token::SWITCH; }
{r_case}		{ return token::CASE; }
{r_default}		{ return token::DEFAULT; }
{r_break}		{ return token::BREAK; }
{r_begin} 		{ return token::BBEGIN; }
{r_end} 		{ return token::BEND; }
{r_do}			{ return token::DO; }
{r_function}	{ return token::FUNC; }
{r_procedure}	{ return token::PROC; }
{r_return}		{ return token::RETURN; }

{integer}		{
	// TODO: fer que torni el valor que toca amb
	// ajuda de this->YYText()
	yylval->emplace<int>(0);
	return token::INT_LITERAL;
}
{id} 			{ 
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

<STRING_LITERAL>[^\\"\n]* { strBuilder.append(this->YYText()); }
<STRING_LITERAL>\\n { strBuilder.append('\n'); }
<STRING_LITERAL>\\t { strBuilder.append('\t'); }
<STRING_LITERAL>\\\" { strBuilder.append('"'); }
<STRING_LITERAL>\" {
	cout << "End string literal" << endl;
	cout << "Trobat $" << strBuilder.getString() <<"$"<< endl;
	BEGIN(INITIAL);

	yylval->emplace<std::string>(strBuilder.getString());
	return token::STR_LITERAL;
}
<STRING_LITERAL>\n {
	// final de línia inesperat
	this->LexerError("Error! final de línia sobtat.");
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
	yy::Syntax::token_type tk = (yy::Syntax::token_type) this->yylex(yylval, l);
	cout << "Token " << tk << " (" << this->YYText() << ")" << endl;
	return tk;
}