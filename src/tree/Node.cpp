#include "Node.h"
#include <iostream>
using namespace std;

int Node::totalNodes = 0;

// Node genèric
Node::Node(NodeType type){
    this->type = type;

    // assignar id
    this->id = ++Node::totalNodes;
}

Node::~Node(){

}

int Node::getId(){
    return this->id;
}

void Node::toDotFile(ofstream &file, Node *parent){

}

// Node Programa
Node_Program::Node_Program() : Node(NodeType::PROGRAM) {
    this->declaracions = nullptr;
}

Node_Program::~Node_Program(){}

void Node_Program::toDotFile(ofstream &file, Node *parent){
    file << "digraph graphname {" << endl;
    file << this->getId() << "[label=\"Programa\"]" << endl;
    this->declaracions->toDotFile(file, this);
    file << "}" << endl;
}


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

void Node_DeclarationList::toDotFile(ofstream &file, Node *parent){
    file << this->getId() << "[label=\"Llista\"]" << endl;
    file << parent->getId() << " -> " << this->getId() << endl;

    if(this->declaracio != nullptr){
        this->declaracio->toDotFile(file, this);
    }

    if(this->llista != nullptr){
        this->llista->toDotFile(file, this);
    }
}


void Node_Declaracio::toDotFile(ofstream &file, Node *parent){
    file << this->getId() << "[label=\"ID\"]" << endl;
    file << parent->getId() << " -> " << this->getId() << endl;
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