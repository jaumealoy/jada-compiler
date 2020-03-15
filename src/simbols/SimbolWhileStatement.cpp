#include "SimbolWhileStatement.h"
#include "../Driver.h"

SimbolWhileStatement::SimbolWhileStatement() : SimbolStatement() {
    this->nomNode = "WhileStatement";
}

SimbolWhileStatement::~SimbolWhileStatement(){}

/**
 * whileStatement -> while exprSimple do bloc end
 */
void SimbolWhileStatement::make(Driver *driver, SimbolExpressio exp,SimbolMarcador m, SimbolBloc bloc) {
    // És un bucle, pot contenir break al seu interior i no es propaga a l'exterior
    // però és possible que tengui un return, que sí s'hauria de propagar
    this->propaga(bloc);

    // i no es propaga el break
    this->_conteBreak = false;

    // Comprovar que l'expressió del while és un boolean
    if(exp.getTSB() != TipusSubjacentBasic::BOOLEAN){
        driver->error( error_tipus_esperat("boolean") );
    }

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "while") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "do") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end") );
    Simbol::toDotFile(driver);

    // GENERACIÓ CODI INTERMEDI
    driver->code.addInstruction(new GoToInstruction(m.getLabel()));
    //driver->code.backpatch(m.getLabel(), bloc.get);
    driver->code.backpatch(m.getLabel(), exp.getCert());
}