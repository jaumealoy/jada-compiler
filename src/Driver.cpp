#include "Driver.h"

Driver::Driver(char *filename){
    this->scanner = new Lexic(filename);
    this->parser = new Syntax(this->scanner, this);

    this->root = nullptr;
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