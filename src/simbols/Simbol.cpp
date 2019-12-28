#include "Simbol.h"
#include "../Driver.h"

int Simbol::totalSimbols = 0;


Simbol::Simbol(){
    this->nodeId = Simbol::totalSimbols++;
    this->nomNode = "<sense nom>";
    this->_empty = false;
}

Simbol::Simbol(std::string nom){
    this->nodeId = Simbol::totalSimbols++;
    this->nomNode = nom;
    this->_empty = false;
}

Simbol::~Simbol(){}

void Simbol::make(Driver *driver){
    this->toDotFile(driver);
}

void Simbol::makeEmpty(){
    this->_empty = true;
}

bool Simbol::isEmpty(){
    return this->_empty;
}

void Simbol::toDotFile(Driver *driver){
    if(this->isEmpty()){
        driver->writeToTree(std::to_string(this->nodeId) + "[label=\""+this->nomNode+"\"]");
        std::string tmp = driver->addTreeChild(this, "&#955;");
        driver->writeToTree(std::to_string(this->nodeId) + " -> " + tmp);
        return;
    }

    driver->writeToTree(std::to_string(this->nodeId) + "[label=\"" + this->nomNode + "\"]");

    // afegint arestes als fills
    for(int i = 0; i < this->fills.size(); i++){
        driver->writeToTree( std::to_string(this->nodeId) + " -> " + this->fills[i]);
    }
    
    driver->writeToTree("{rank=same;");
    for(int i = 0; i < this->fills.size(); i++){
        driver->writeToTree(this->fills[i] + ";");
    }
    driver->writeToTree("}");

    
    for(int i = 1; i < this->fills.size(); i++){
        driver->writeToTree( this->fills[i - 1] + " -> " + this->fills[i] + " [style=invis]");
    }


    this->fills.clear();
}

int Simbol::getNodeId(){
    return this->nodeId;
}