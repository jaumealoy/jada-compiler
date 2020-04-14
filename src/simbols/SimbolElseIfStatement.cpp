#include "SimbolElseIfStatement.h"
#include "../Driver.h"

SimbolElseIfStatement::SimbolElseIfStatement() : SimbolStatement() {
    this->nomNode = "ElseIfStatement";
}

SimbolElseIfStatement::~SimbolElseIfStatement(){}

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
    Simbol::toDotFile(driver);

    // generació de codi
    driver->code.backpatch(ebloc.getLabel(), exp.getCert());
    this->seg = CodeGeneration::convert(exp.getFals());

	// el final no es coneix però no és el mateix punt que el següent else if / else
	this->finals = bloc.getSeg();

	// aquesta instrucció és la del final del bloc, no s'ha d'executar cap bloc més
    Instruction *inst = driver->code.addInstruction(new GoToInstruction(nullptr));
	this->finals.push_back(inst);
}

/**
 * elseIfStatement -> elseIfStatement ELSE IF M0 exprSimple DO M0 bloc
 */
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

    // generació de codi
	// els possibles salts de l'avaluació a fals de l'expressió del else if / if anterior
    driver->code.backpatch(einici.getLabel(), elseif.getSeg());

	// el salts de l'avaluació a cert de l'expressió actual
    driver->code.backpatch(ebloc.getLabel(), exp.getCert());

	// els salts al següent else if / else
    this->seg = CodeGeneration::convert(exp.getFals());

	// el final és deconegut i no és el mateix punt que l'inici del següent
	// else if / else
    this->finals = elseif.getFinals();
    Instruction *inst = driver->code.addInstruction( new GoToInstruction(nullptr) );
	this->finals.push_back(inst);
}

std::list<Instruction *> SimbolElseIfStatement::getFinals(){
	return this->finals;
}