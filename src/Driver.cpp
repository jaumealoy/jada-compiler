#include "Driver.h"

#include "taulasimbols/TaulaSimbols.h"
#include "taulasimbols/DescripcioTipus.h"

Driver::Driver(char *filename){
    this->scanner = new Lexic(filename);
    this->parser = new Syntax(this->scanner, this);

    this->root = nullptr;

    TaulaSimbols ts;

    // inicialitzar la taula de símbols amb els tipus propis del llenguatge
    DescripcioTipus boolean(TSB::BOOLEAN, 0, 1);
    ts.posar("boolean", boolean);

    DescripcioTipus character(TSB::CHAR, 0, 255);
    ts.posar("char", character);

    DescripcioTipus integer(TSB::INT, (long) 0, ~((long)0));
    ts.posar("int", integer);

}

Driver::~Driver(){

}

Node_Program * Driver::parse(){
    parser->parse();
    return this->root;
}

void Driver::setRoot(Node_Program *root){
    this->root = root;
}