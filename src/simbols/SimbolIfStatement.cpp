#include "SimbolIfStatement.h"
#include "../Driver.h"
#include "../code/instructions/SkipInstruction.h"

SimbolIfStatement::SimbolIfStatement() : SimbolStatement() {
    this->nomNode = "IfStatement";
}

SimbolIfStatement::~SimbolIfStatement() { }

//ifStatement : elseStatement BEND
void SimbolIfStatement::make(Driver *driver, SimbolElseStatement elseS){
    this->propaga(elseS);


    this->fills.push_back( std::to_string(elseS.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end") );
    Simbol::toDotFile(driver);

    //Etiqueta del final
    driver->code.addInstruction(new SkipInstruction(elseS.final));
    this->seg = elseS.getSeg();
    //printf("%d", lfinal.getId());
}