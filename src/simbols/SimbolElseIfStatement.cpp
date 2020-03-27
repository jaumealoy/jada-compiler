#include "SimbolElseIfStatement.h"
#include "../Driver.h"

SimbolElseIfStatement::SimbolElseIfStatement() : SimbolStatement() {
    this->nomNode = "ElseIfStatement";
}

SimbolElseIfStatement::~SimbolElseIfStatement(){}

/**
 * elseIfStatement -> else if exprSimple do bloc end elseIfStatement
 */
/*void SimbolElseIfStatement::make(Driver *driver, SimbolExpressio exp, SimbolMarcador marc, SimbolBloc bloc, SimbolElseIfStatement elseIf){
    // comprovar que l'expressió és un boolean
    if(exp.getTSB() != TipusSubjacentBasic::BOOLEAN){
        driver->error( error_tipus_esperat(TipusSubjacentBasic::BOOLEAN) );
    }

    // propagar els possibles returns i breaks que benguin de bloc i elseIfStatement
    this->propaga(bloc, elseIf);

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "else if") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "do") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end") );
    this->fills.push_back( std::to_string(elseIf.getNodeId()) );
    Simbol::toDotFile(driver);
}*/

//ElseIfStatement -> IF exprSimple DO M0 bloc 
void SimbolElseIfStatement::make(Driver *driver, SimbolExpressio exp, SimbolMarcador ebloc, SimbolBloc bloc){
    // comprovar que l'expressió és un boolean
    if(exp.getTSB() != TipusSubjacentBasic::BOOLEAN){
        driver->error( error_tipus_esperat(TipusSubjacentBasic::BOOLEAN) );
    }

    // propagar els possibles returns i breaks que venguin de bloc i elseIfStatement
    this->propaga(bloc);

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "if") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "do") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end") );
    //this->fills.push_back( std::to_string(elseIf.getNodeId()) );
    Simbol::toDotFile(driver);

    //generació de codi
    driver->code.backpatch(ebloc.getLabel(), exp.getCert());
    //driver->code.backpatch(einici.getLabel(), bloc.getSeg());
    this->seg = exp.getFals();
    this->final = driver->code.addLabel();
    driver->code.backpatch(final, bloc.getSeg());
    driver->code.addInstruction(new GoToInstruction(this->final));

}

//elseIfStatement -> elseIfStatement ELSE IF M0 exprSimple DO M0 bloc
void SimbolElseIfStatement::make(Driver *driver, SimbolElseIfStatement elseif, SimbolMarcador einici, SimbolExpressio exp, SimbolMarcador ebloc, SimbolBloc bloc){
    // comprovar que l'expressió és un boolean
    if (exp.getTSB() != TipusSubjacentBasic::BOOLEAN){
        driver->error( error_tipus_esperat(TipusSubjacentBasic::BOOLEAN) );
    }

    this->propaga(bloc, elseif);
    
    // pintar a l'arbre
    this->fills.push_back( std::to_string(elseif.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "else if") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "do") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    Simbol::toDotFile(driver);

    //generació de codi
    driver->code.backpatch(ebloc.getLabel(), exp.getCert());
    driver->code.backpatch(einici.getLabel(), elseif.getSeg());
    //driver->code.backpatch(einici.getLabel(), bloc.getSeg());
    this->seg = exp.getFals();
    this->final = elseif.final;
    driver->code.backpatch(final, bloc.getSeg());
    driver->code.addInstruction(new GoToInstruction(this->final));

}