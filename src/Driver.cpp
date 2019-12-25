#include "Driver.h"

Driver::Driver(char *filename){
    this->scanner = new Lexic(filename);
    this->parser = new Syntax(this->scanner, this);

    // inicialitzar la taula de símbols
    this->ts = TaulaSimbols();
    this->ts.buida();

    // inicialitzar la taula de símbols amb els tipus propis del llenguatge
    DescripcioTipusBasic *boolean = new DescripcioTipusBasic(TipusSubjacentBasic::BOOLEAN, 0, 1, 1);
    this->ts.posar("boolean", boolean);

    DescripcioTipusBasic *character = new DescripcioTipusBasic(TipusSubjacentBasic::CHAR, 0, 255, 1);
    this->ts.posar("char", character);

    DescripcioTipusBasic *integer = new DescripcioTipusBasic(TipusSubjacentBasic::INT, (long) 0, ~((long)0), 8);
    this->ts.posar("int", integer);

    DescripcioTipusBasic *string = new DescripcioTipusBasic(TipusSubjacentBasic::CHAR, 0, 255, 8);
    this->ts.posar("string", string);

    // funcions pròpies
    DescripcioFuncio *readChar = new DescripcioFuncio();
    readChar->setTipusRetorn("char");
    this->ts.posar("readChar", readChar);
}

Driver::~Driver(){

}

void Driver::parse(){
    parser->parse();
}

void Driver::error(std::string msg){
    std::cerr << msg << std::endl;
}
