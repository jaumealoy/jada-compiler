#include "Node.h"

// Node genèric
Node::Node(NodeType type){
    this->type = type;
}

Node::~Node(){

}

void Node::toDotFile(ofstream * file){

}

// Node Programa
Node_Program::Node_Program() : Node(NodeType::PROGRAM) {
    this->declaracions = nullptr;
}

Node_Program::~Node_Program(){}

void Node_Program::setDeclaracions(Node_DeclarationList *declaracions){
    this->declaracions = declaracions;
}

// Node Llista declaracions
Node_DeclarationList::Node_DeclarationList() : Node(NodeType::DECLLIST){
    this->declaracio = nullptr;
    this->llista = nullptr;
}

Node_DeclarationList::~Node_DeclarationList(){

}

void Node_DeclarationList::setDeclaracio(Node_Declaracio *node){
    this->declaracio = node;
}

void Node_DeclarationList::setDeclaracions(Node_DeclarationList *node){
    this->llista = node;
}

// Node Declaracio
Node_Declaracio::Node_Declaracio() : Node(NodeType::DECL){
    this->declaracio = nullptr;
}

Node_Declaracio::~Node_Declaracio(){
    
}