#include "Driver.h"

Driver::Driver(char *filename){
    this->scanner = new Lexic(filename);
    this->parser = new Syntax(this->scanner, this);

    // inicialitzar la taula de símbols
    this->ts = TaulaSimbols();
    this->ts.buida();

    // inicialitzar la taula de símbols amb els tipus propis del llenguatge
    DescripcioTipus boolean(TSB::BOOLEAN, 0, 1);
    this->ts.posar("boolean", boolean);

    DescripcioTipus character(TSB::CHAR, 0, 255);
    this->ts.posar("char", character);

    DescripcioTipus integer(TSB::INT, (long) 0, ~((long)0));
    this->ts.posar("int", integer);

}

Driver::~Driver(){

}

void Driver::parse(){
    parser->parse();
}

