#include "Errors.h"
#include "taulasimbols/TipusSubjacentBasic.h"

/**
 * Error que es produeix quan s'intenta redefinir una entrada a la taula
 * de símbols i no es pot fer (és una entrada protegida o ja existeix
 * al nivell actual de profunditat)
 */
std::string error_redefinicio(std::string str){
    return "no es pot redefinir " + str;
}


/**
 * Quan s'utilitza una identificador com un tipus però no ho és realment
 */
std::string error_no_tipus(std::string str){
    return str + " no descriu un tipus";
}

/**
 * No existeix un procediment principal vàlid (anomenat main i sense paràmetres)
 */
std::string error_no_procediment_principal(){
    return "no existeix un procediment principal vàlid";
}

/**
 * Tipus no compatibles
 */
std::string error_tipus_no_compatibles(std::string a){
    return "tipus " + a + " no és compatible amb expressió";
}

std::string error_tipus_no_compatibles(std::string a, std::string b){
    return "tipus " + a + " no és compatible amb " + b;
}

std::string error_tipus_no_compatibles(TipusSubjacentBasic a, TipusSubjacentBasic b){
    return "tipus " + TSB::getNomTSB(a) + " no és compatible amb " + TSB::getNomTSB(b);
}


std::string error_tipus_no_compatibles_operador(TipusSubjacentBasic a){
    return "tipus " + TSB::getNomTSB(a) + " no és compatible amb l'operador";
}


/**
 * Error produit per incompatibilitat de tipus subjacents bàsics
 */
std::string error_tipus_esperat(std::string a){
    return "s'esperava un " + a;
}

std::string error_tipus_esperat(TipusSubjacentBasic a){
    return "s'esperava un " + TSB::getNomTSB(a);
}

/**
 * Quan s'intenta fer una divisitio entre zero amb valors constants
 */
std::string error_divisio_zero(){
    return "divisió entre zero";
}

/**
 * Intent de comparar un array
 */
std::string error_tipus_no_comparable(){
    return "tipus no comparable";
}

std::string error_tipus_no_comparable(std::string a){
    return a + " no comparable";
}

/**
 * Intent de crear una funció que retorna un array
 */
std::string error_retorn_array(){
    return "no es poden retornar arrays";
}

std::string error_creacio_array(TipusSubjacentBasic a){
    return "no es poden crear array de " + a;
}

/**
 * Intent de comparar dos valors de tipus diferents
 */
std::string error_tipus_no_comparable(TipusSubjacentBasic a, TipusSubjacentBasic b){
    return TSB::getNomTSB(a) + " no és comparable amb " + TSB::getNomTSB(b);
}

std::string error_tipus_no_comparable(std::string a, std::string b){
    return a + " no és comparable amb " + b;
}

/**
 * Excés de paràmetres en la crida d'una funció
 */
std::string error_sobren_parametres(){
    return "sobren paràmetres";
}

/**
 * Falta de paràmetres en la crida d'una funció
 */
std::string error_falten_parametres(){
    return "falten paràmetres";
}

std::string error_parametre_ja_definit(std::string nomF, std::string nomP){
    return "'"+nomP+"' ja està definit a " + nomF; 
}


/**
 * S'han especificat massa dimensions
 */
std::string error_sobren_dimensions(){
    return "sobren dimensions";
}

/**
 * Falten dimensions per especificar
 */
std::string error_falten_dimensions(){
    return "falten dimensions";
}

/**
 * S'intenta accedir a un índex fora de rang
 */
std::string error_fora_de_rang(int valor){
    return "fora de rang (" + std::to_string(valor) + ")";
}

/**
 * Ús d'un nom no definit a la taula de símbols
 */
std::string error_no_definit(std::string a){
    return "'" + a + "' no està definit";
}

/**
 * Intent de modificar o utilitzar una constant en una expressió
 * que requereix que no sigui constant
 */
std::string error_es_constant(std::string valor){
    return "no pot ser una constant";
}

std::string error_no_subprograma(std::string a){
    return a + " no és un subprograma";
}

std::string error_return_incompatible(TipusSubjacentBasic a){
    return TSB::getNomTSB(a) + " no és compatible amb el tipus de retorn";
}

std::string error_return_incompatible(std::string a){
    return a + " no és compatible amb el tipus de retorn";
}

std::string error_falta_retorn(){
    return "falta un (o més) return";
}

std::string error_sobren_retorn(){
    return "no hi pot haver un return";
}

/**
 * S'ha trobat un break que no és dins un for / while
 */
std::string error_break_invalid(){
    return "no hi pot haver un break";
}

/**
 * Declaració d'una constant sense inicialitzar-la
 */
std::string error_constant_no_inicialitzada(std::string c){
    return c + " constant no inicialitzada";
}

/**
 * Una expressió no és una constant
 */
std::string error_valor_no_constant(){
    return "no és un valor constant";
}

std::string error_valor_no_constant(TipusSubjacentBasic a){
    return "no és un valor constant de tipus " + TSB::getNomTSB(a);
}

/**
 * S'intenta utilitza una referència com una variable
 */
std::string error_no_variable(std::string c){
    return c + " no és una variable";
}

std::string error_default_definit(){
    return "ja existeix un case default definit";
}

std::string error_default_darrer(){
    return "el default ha de ser la darrera opció";
}

std::string error_case_definit(std::string a){
    return "cas '" + a + "' duplicat";
}

std::string error_no_posicio_memoria(std::string c){
    return c + " no és una variable ni una constant";
}

std::string error_noms_cap(std::string real, std::string esperat){
    return "s'ha trobat " + real + " i s'esperava " + esperat;
}

std::string error_nom_parametre_nom_funcio(){
    return "no pots declarar una variable com el nom d'una funció";
}

std::string error_creacio_punter(TipusSubjacentBasic tsb){
	return "no es poden declarar punters de " + TSB::getNomTSB(tsb);
}

std::string error_tipus_punter(){
	return "no descriu un tipus punter vàlid";
}