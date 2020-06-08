#include "SimbolDimensionList.h"
#include "SimbolExpressio.h"
#include "../Driver.h"

SimbolDimensionList::SimbolDimensionList()
    : Simbol("DimensionList")
{

}

SimbolDimensionList::~SimbolDimensionList(){}

/**
 * dimList -> [ exprSimple ]
 */
void SimbolDimensionList::make(Driver *driver, SimbolExpressio exp)
{
    if(exp.isNull()){
        // l'expressió és invàlida
        return;
    }

    // és la primera dimensió, s'inicialitza la llista
    this->expressions.clear();
    this->expressions.push_back(exp);

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "[") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "]") );
    Simbol::toDotFile(driver);
}

/**
 * dimList -> dimList [ exprSimple ]
 */
void SimbolDimensionList::make(Driver *driver, SimbolDimensionList list, SimbolExpressio exp)
{
    if(exp.isNull() || list.expressions.empty()){
        // expressió actual o anteriors malformades
        return;
    }

    this->expressions = list.expressions;
    this->expressions.push_back(exp);

    // pintar a l'arbre
    this->fills.push_back( std::to_string(list.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "[") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "]") );
    Simbol::toDotFile(driver);
}

std::list<SimbolExpressio> &SimbolDimensionList::getDimensionList(){
    return this->expressions;
}