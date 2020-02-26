#include "tresa.h";

tresa::tresa(){}

tresa::tresa(TATIPUS tipus, int op1, int op2, int op3){
    this->tipus = tipus;
    this->op1 = op1;
    this->op2 = op2;
    this->op3 = op3;
}

std::string tresa::toString(){
    return "Tipus :" + std::to_string(tipus) + ", Operador 1: " + std::to_string(op1) + ", Operador 2: " + std::to_string(op2) + ", Operador 3: " + std::to_string(op3);
}