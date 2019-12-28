#include "Driver.h"


Driver::Driver(char *filename) : 
        treeFile("tree.dot", std::fstream::out),
        tokensFile("tokens.txt", std::fstream::out) {
    this->scanner = new Lexic(filename, tokensFile);
    this->parser = new Syntax(this->scanner, this);

    // inicialitzar la taula de símbols
    this->ts = TaulaSimbols();
    this->ts.buida();

    // inicialitzar la taula de símbols amb els tipus propis del llenguatge
    DescripcioTipusBasic *boolean = new DescripcioTipusBasic(TipusSubjacentBasic::BOOLEAN, 0, 1, 1);
    this->ts.posar("boolean", boolean);

    // afegir true i false
    DescripcioConstant *dc = new DescripcioConstant("boolean");
    dc->setBoolValue(true);
    this->ts.posar("true", dc);

    dc = new DescripcioConstant("boolean");
    dc->setBoolValue(false);
    this->ts.posar("false", dc);

    DescripcioTipusBasic *character = new DescripcioTipusBasic(TipusSubjacentBasic::CHAR, 0, 255, 1);
    this->ts.posar("char", character);

    DescripcioTipusBasic *integer = new DescripcioTipusBasic(TipusSubjacentBasic::INT, (long) 0, ~((long)0), 8);
    this->ts.posar("int", integer);

    DescripcioTipusArray *string = new DescripcioTipusArray("char");
    this->ts.posar("string", string);

    // funcions pròpies
    DescripcioFuncio *readChar = new DescripcioFuncio();
    readChar->setTipusRetorn("char");
    this->ts.posar("readChar", readChar);

    DescripcioProc *printChar = new DescripcioProc();
    this->ts.posar("printChar", printChar);
    this->ts.posarParam("printChar", "caracter", new DescripcioArgument("char", DescripcioArgument::IN));

    DescripcioProc *print = new DescripcioProc();
    this->ts.posar("print", print);
    this->ts.posarParam("print", "msg", new DescripcioArgument("string", DescripcioArgument::IN_OUT));

    DescripcioFuncio *readInt = new DescripcioFuncio();
    readInt->setTipusRetorn("int");
    this->ts.posar("readInt", readInt);

    // inicialitzar fitxer de l'arbre
    this->writeToTree("digraph arbreSintactic {");
}

Driver::~Driver(){

}

void Driver::parse(){
    parser->parse();
}

void Driver::error(std::string msg){
    std::cerr << msg << std::endl;
}

void Driver::error(std::string msg, bool atura){
    std::cerr << msg << std::endl;
    if (atura){
        throw TaulaSimbols::NomNoExistent();
    }
}

void Driver::writeToTree(std::string data){
    this->treeFile << data << std::endl;
}

// comptador de missatges únics
int msgId = 0;

void Driver::writeToTree(Simbol *s, std::string data){
    std::string newNodeId = "\"" + std::to_string(s->getNodeId()) + "_" + std::to_string(msgId++) +  "\"";
    this->writeToTree(newNodeId + "[label=\""+ data +"\", shape=plaintext]");
    this->writeToTree(std::to_string(s->getNodeId()) + " -> " + newNodeId);
}

std::string Driver::addTreeChild(Simbol *s, std::string data){
    std::string newNodeId = "\"" + std::to_string(s->getNodeId()) + "_" + std::to_string(msgId++) +  "\"";
    this->writeToTree(newNodeId + "[label=\""+ data +"\", shape=plaintext]");

    return newNodeId;
}

void Driver::closeFiles(){
    // tancar l'arbre sintàctic
    this->writeToTree("}");
    this->treeFile.close();

    // tancar la seqüència de tokens
    this->tokensFile.close();
}
