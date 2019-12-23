#include "Driver.h"

Driver::Driver(char *filename){
    this->scanner = new Lexic(filename);
    this->parser = new Syntax(this->scanner, this);

    // inicialitzar la taula de símbols
    this->ts = TaulaSimbols();
    this->ts.buida();

    // inicialitzar la taula de símbols amb els tipus propis del llenguatge
    DescripcioTipusBasic *boolean = new DescripcioTipusBasic(TSB::BOOLEAN, 0, 1);
    this->ts.posar("boolean", boolean);

    DescripcioTipusBasic *character = new DescripcioTipusBasic(TSB::CHAR, 0, 255);
    this->ts.posar("char", character);

    DescripcioTipusBasic *integer = new DescripcioTipusBasic(TSB::INT, (long) 0, ~((long)0));
    this->ts.posar("int", integer);

    // funcions pròpies
    DescripcioFuncio *f = new DescripcioFuncio();
    f->setTipusRetorn("char");
    this->ts.posar("readChar", f);

    // recuperar informació
    Descripcio *f1 = this->ts.consulta("readChar");
    DescripcioFuncio *f2 = dynamic_cast<DescripcioFuncio*>(f1);
    std::cout << "tipus retorn és " << f2->getTipusRetorn() << std::endl;
    std::cout << "tipus retorn hauria de ser " << f->getTipusRetorn() << std::endl;

}

Driver::~Driver(){

}

void Driver::parse(){
    parser->parse();
}

void Driver::error(std::string msg){
    std::cerr << msg << std::endl;
}
