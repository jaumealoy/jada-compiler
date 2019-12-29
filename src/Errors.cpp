#include "Errors.h"

std::string getNomTSB(TipusSubjacentBasic a){
    switch(a){
        case INT:
            return "enter";
            break;
        
        case BOOLEAN:
            return "boolean";
            break;
        
        case CHAR:
            return "caràcter";
            break;

        case ARRAY:
            return "array";
            break;
    }
}

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
    return "tipus " + getNomTSB(a) + " no és compatible amb " + getNomTSB(b);
}


std::string error_tipus_no_compatibles_operador(TipusSubjacentBasic a){
    return "tipus " + getNomTSB(a) + " no és compatible amb l'operador";
}


/**
 * Error produit per incompatibilitat de tipus subjacents bàsics
 */
std::string error_tipus_esperat(std::string a){
    return "s'esperava un " + a;
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

/**
 * Intent de crear una funció que retorna un array
 */
std::string error_retorn_array(){
    return "no es poden retornar arrays";
}

/**
 * Intent de comparar dos valors de tipus diferents
 */
std::string error_tipus_no_comparable(TipusSubjacentBasic a, TipusSubjacentBasic b){
    return getNomTSB(a) + " no és comparable amb " + getNomTSB(b);
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

std::string error_falta_retorn(){
    return "falta un (o més) return";
}

std::string error_sobren_retorn(){
    return "no hi pot haver un return";
}

std::string error_break_invalid(){
    return "no hi pot haver un break";
}

std::string error_constant_no_inicialitzada(std::string c){
    return c + " constant no inicialitzada";
}

std::string error_valor_no_constant(){
    return "no és un valor constant";
}

/**
 * S'intenta utilitza una referència com una variable
 */
std::string error_no_variable(std::string c){
    return c + " no és una variable";
}
