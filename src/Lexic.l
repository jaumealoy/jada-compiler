%{
// Codi en C/C++
#include <stdio.h>
#include <iostream>
#include <fstream>
#include "Lexic.h"
#include "strings/StringBuffer.h"

#undef  YY_DECL
#define YY_DECL int Lexic::yylex( yy::Syntax::semantic_type * const lval, yy::Syntax::location_type *location )

using namespace std;
using token = yy::Syntax::token;

StringBuffer strBuilder;

char foundCh;
bool finalpossible;
int charLen;

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

op_add \+
op_minus -
op_div \/
op_mul \*

/* Símbols */
sym_eq =
sym_squote '
sym_dquote \"
sym_lparan \(
sym_rparan \)
sym_colon :
sym_semicolon ;
sym_coma ,
sym_lbracket \[
sym_rbracket \]

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
r_while while
r_for for
r_const const

/* Altres */
new_line ([\n\r]|(\n\r))+
blank [ \t\r]+

/* Comentaris */
comment "//"([^\n])*
begin_comment "/*"

/* Modes de scan */
%x STRING_LITERAL
%x CHAR_LITERAL_MODE
%x COMENTARI	


%{
  // Code run each time a pattern is matched.
  # define YY_USER_ACTION  location->columns(yyleng);

%}

%%
%{
	location->step();
%}

{op_gte}		{ return token::OP_GTE; }
{op_gt}			{ return token::OP_GT; }
{op_lte}		{ return token::OP_LTE; }
{op_lt}			{ return token::OP_LT; }
{op_eq}			{ return token::OP_EQ; }
{op_neq}		{ return token::OP_NEQ; }

{op_add}		{ return token::OP_ADD; }
{op_minus}		{ return token::OP_MINUS; }
{op_div}		{ return token::OP_TIMES; }
{op_mul}		{ return token::OP_DIV; }


{sym_eq}		{ return token::EQ; }
{sym_squote}	{
	cout << "Detectada coma simple. Entramos modo CHAR_LITERAL "<< this->YYText() << "  " << endl;
	BEGIN(CHAR_LITERAL_MODE);
}
{sym_dquote}	{
	strBuilder.clear();
	BEGIN(STRING_LITERAL);
}
{sym_lparan}	{ return token::LEFTPARAN; }
{sym_rparan}	{ return token::RIGHTPARAN; }
{sym_colon}		{ return token::COLON; }
{sym_semicolon}	{ return token::SEMICOLON; }
{sym_coma}		{ return token::COMA; }
{sym_lbracket}	{ return token::LEFTBRACKET; }
{sym_rbracket}	{ return token::RIGHTBRACKET; }

{comment} 		{ }
{begin_comment} {
	BEGIN(COMENTARI);
 }

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
{r_while}		{ return token::WHILE; }
{r_for}			{ return token::FOR; }
{r_const}		{ return token::CONST; }

{integer}		{
	lval->emplace<int>() = atoi(this->YYText());
	return token::INT_LITERAL;
}
{id} 			{ 
	lval->emplace<std::string>() = this->YYText();
	return token::ID; 
}

{new_line} { 
	// TODO: sumar linia, reiniciar columnes
	location->lines(yyleng); 
	location->step();
}
{blank} { 
	location->step();
}

<<EOF>> {
	return token::ENDFILE;
}

<STRING_LITERAL>[^\\"\n]* { strBuilder.append(this->YYText()); }
<STRING_LITERAL>\\n { strBuilder.append('\n'); }
<STRING_LITERAL>\\t { strBuilder.append('\t'); }
<STRING_LITERAL>\\\" { strBuilder.append('"'); }
<STRING_LITERAL>\" {
	BEGIN(INITIAL);

	lval->emplace<std::string>(strBuilder.getString());
	return token::STR_LITERAL;
}
<STRING_LITERAL>\n {
	// final de línia inesperat
	this->LexerError("Error! final de línia sobtat.");
}

<CHAR_LITERAL_MODE>[^\\'\n\t] { 
	charLen++ ; 
	foundCh = this->YYText()[0]; 
}
<CHAR_LITERAL_MODE>\n { cout << "Encontrado salto línea" << endl; charLen++ ; foundCh = '\n'; }
<CHAR_LITERAL_MODE>\t { cout << "Encontrado tabulador" << endl; charLen++ ; foundCh = '\t'; }
<CHAR_LITERAL_MODE>\\' { foundCh = '\''; charLen++ ;cout << "Encontrada comilla escapada" << endl; }
<CHAR_LITERAL_MODE>' {
	cout << "Encontrado final de caracter. Comilla final." << endl;
	cout << "Found %" << foundCh << "%" << endl;
	BEGIN(INITIAL);

	if (charLen > 1) {
		this->LexerError("Error! char amb més d'una lletra");
	}

	lval->emplace<char>(foundCh);
	return token::CHAR_LITERAL;
}

. { cout << "ERROR: " << this->YYText() << endl; }

	
<COMENTARI>[^*\/]* { cout << "Caràcter trobat." << endl; finalpossible = false; }
<COMENTARI>\* {
	finalpossible = true;
}
<COMENTARI>"/" {
	if (finalpossible){
		cout << "Final de comentari." << endl;
		BEGIN(INITIAL);
	}
}

%%


// Codi que inclourà l'arxiu, en concret, el body de les funcions
Lexic::Lexic(char * filename, fstream &tokensFile)
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

int Lexic::getToken(yy::Syntax::semantic_type *yylval, yy::location * l){
	l->step();
	int tk = this->yylex(yylval, l);
	this->tokensFile << "Token " << tk << " (" << this->YYText() << ")" << endl;
	return tk;
}
