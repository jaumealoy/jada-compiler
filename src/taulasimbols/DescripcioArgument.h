#ifndef _H_DESCRIPCIOARG
#define _H_DESCRIPCIOARG

#include "Descripcio.h"
#include "TipusSubjacentBasic.h"
#include <string>

using namespace TSB;

class DescripcioArgument : public Descripcio {
private:
    std::string tipus;
public:
    DescripcioArgument( std::string tipus){
        
    }

    ~DescripcioArgument(){}
};

#endif