#include "SimbolForStatement.h"
#include "../Driver.h"

SimbolForStatement::SimbolForStatement() : SimbolStatement() {
    this->nomNode = "ForStatement";
}

SimbolForStatement::~SimbolForStatement(){}

/**
 * forStatement -> for (forInit; exprSimple; forPostExpression) do bloc end
 */
void SimbolForStatement::make(Driver *driver, SimbolForInit init, SimbolExpressio exp, SimbolForPostExpression post, SimbolBloc bloc) {
    // És un bucle, pot contenir break al seu interior i no es propaga a l'exterior
    // però és possible que tengui un return, que sí s'hauria de propagar
    this->propaga(bloc);

    // i no es propaga el break
    this->_conteBreak = false;

    // Comprovar que l'expressió del for és un boolean
    if(exp.getTSB() != TipusSubjacentBasic::BOOLEAN){
        driver->error( error_tipus_esperat(TipusSubjacentBasic::BOOLEAN) , true);
    }

    // i surt de l'àmbit del for
    driver->ts.surtirBloc();

    // i pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "for (") );
    this->fills.push_back( std::to_string(init.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ";") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ";") );
    this->fills.push_back( std::to_string(post.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ") do") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end") );
    Simbol::toDotFile(driver);
}