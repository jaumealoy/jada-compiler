#include "SimbolForStatement.h"
#include "../Driver.h"
#include "../code/instructions/SkipInstruction.h"

SimbolForStatement::SimbolForStatement() : SimbolStatement() {
    this->nomNode = "ForStatement";
}

SimbolForStatement::~SimbolForStatement(){}

/**
 * forStatement -> for (forInit; M exprSimple; forPostExpression) do M bloc M2 end
 */
void SimbolForStatement::make(Driver *driver, SimbolForInit init, SimbolExpressio exp, 
		SimbolForPostExpression post, SimbolBloc bloc, SimbolMarcador inici, SimbolMarcador iniciBloc, SimbolMarcador endBloc) {
    // És un bucle, pot contenir break al seu interior i no es propaga a l'exterior
    // però és possible que tengui un return, que sí s'hauria de propagar
    this->propaga(bloc);

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
    this->fills.push_back( std::to_string(inici.getNodeId()) );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ";") );
    this->fills.push_back( std::to_string(post.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ") do") );
    this->fills.push_back( std::to_string(iniciBloc.getNodeId()) );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end") );
    Simbol::toDotFile(driver);

	// generació de codi
	driver->code.backpatch(iniciBloc.getLabel(), exp.getCert());
	this->seg = CodeGeneration::convert(exp.getFals());

	((SkipInstruction *) iniciBloc.getInstruction())->setLoopStart(true);

	// tots els breaks s'han d'afegir seg
	std::list<Instruction *>::iterator it;
	for(it = this->_breakList.begin(); it != this->_breakList.end(); it++){
		this->seg.push_back(*it);
	}

	// indicar que no es propaga el break
    this->_conteBreak = false;
	this->_breakList.clear();

	// el darrer codi que s'ha generat ha estat el del bloc
	if(!post.isEmpty()){
		// s'ha d'executar codi després d'executar el bloc
		driver->code.move(post.getBegin(), post.getEnd(), endBloc.getInstruction());

		// eliminar instruccions generades artificialment per moure codi
		driver->code.remove(post.getBegin());
		driver->code.remove(post.getEnd());
		driver->code.remove(endBloc.getInstruction());
	}

	// en qualsevol cas s'ha d'avaluar la condició de nou
	driver->code.backpatch(inici.getLabel(), bloc.getSeg());
	driver->code.addInstruction(new GoToInstruction(inici.getLabel()));
}