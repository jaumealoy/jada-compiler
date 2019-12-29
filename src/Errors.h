#ifndef _H_ERRORS

#include <string>
#include "taulasimbols/TipusSubjacentBasic.h"

std::string error_no_definit(std::string str);
std::string error_redefinicio(std::string str);
std::string error_no_tipus(std::string str);
std::string error_no_procediment_principal();

std::string error_tipus_no_compatibles(std::string a);
std::string error_tipus_no_compatibles(std::string a, std::string b);
std::string error_tipus_no_compatibles(TipusSubjacentBasic a, TipusSubjacentBasic b);
std::string error_tipus_no_compatibles_operador(TipusSubjacentBasic a);

std::string error_divisio_zero();
std::string error_tipus_esperat(std::string a);
std::string error_return_incompatible(std::string a);
std::string error_tipus_no_comparable();
std::string error_tipus_no_comparable(TipusSubjacentBasic a, TipusSubjacentBasic b);
std::string error_tipus_no_comparable(std::string a, std::string b);

std::string error_no_subprograma(std::string str);

std::string error_parametre_ja_definit(std::string nomF, std::string nomP);
std::string error_sobren_parametres();
std::string error_falten_parametres();

std::string error_sobren_dimensions();
std::string error_falten_dimensions();

std::string error_es_constant(std::string a);
std::string error_retorn_array();

std::string error_falta_retorn();
std::string error_sobren_retorn();
std::string error_break_invalid();

std::string error_constant_no_inicialitzada(std::string c);
std::string error_valor_no_constant();
std::string error_no_variable(std::string c);

#endif