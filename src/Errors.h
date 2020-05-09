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
std::string error_tipus_esperat(TipusSubjacentBasic a);

std::string error_return_incompatible(std::string a);
std::string error_return_incompatible(TipusSubjacentBasic a);
std::string error_tipus_no_comparable();
std::string error_tipus_no_comparable(std::string a);
std::string error_tipus_no_comparable(TipusSubjacentBasic a, TipusSubjacentBasic b);
std::string error_tipus_no_comparable(std::string a, std::string b);

std::string error_no_subprograma(std::string str);

std::string error_parametre_ja_definit(std::string nomF, std::string nomP);
std::string error_sobren_parametres();
std::string error_falten_parametres();

std::string error_sobren_dimensions();
std::string error_falten_dimensions();

std::string error_es_constant(std::string a);
std::string error_creacio_array(TipusSubjacentBasic a);
std::string error_fora_de_rang(int valor);

std::string error_retorn_array();
std::string error_falta_retorn();
std::string error_sobren_retorn();
std::string error_break_invalid();

std::string error_nom_parametre_nom_funcio();

std::string error_constant_no_inicialitzada(std::string c);
std::string error_valor_no_constant();
std::string error_valor_no_constant(TipusSubjacentBasic a);
std::string error_no_variable(std::string c);
std::string error_no_posicio_memoria(std::string c);

std::string error_noms_cap(std::string real, std::string esperat);

// Errors Switch
std::string error_default_definit();
std::string error_default_darrer();
std::string error_case_definit(std::string a);

std::string error_creacio_punter(TipusSubjacentBasic);
std::string error_tipus_punter();

#endif