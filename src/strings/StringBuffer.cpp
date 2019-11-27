#include "StringBuffer.h"

StringBuffer::StringBuffer(){
    this->myString = string();
}

StringBuffer::~StringBuffer(){

}

void StringBuffer::append(char c){
    this->myString += c;
}

void StringBuffer::append(string str){
    this->myString += str;
}

string StringBuffer::getString(){
    return this->myString;
}

void StringBuffer::clear(){
    this->myString.clear();
}