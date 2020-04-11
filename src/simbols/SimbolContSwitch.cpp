#include "SimbolContSwitch.h"
#include "../Driver.h"
#include "../code/instructions/CondJumpInstruction.h"
#include "../code/instructions/GoToInstruction.h"
#include "../code/instructions/AssignmentInstruction.h"
#include "../code/instructions/SkipInstruction.h"

SimbolContSwitch::SimbolContSwitch() : SimbolStatement() {
    this->nomNode = "ContSwitch";
}

SimbolContSwitch::~SimbolContSwitch(){}

/**
 * Part principal de l'switch
 * contSwitch -> exprSimple )
 */
void SimbolContSwitch::make(Driver *driver, SimbolExpressio exp){
	// expressió mal formada
	if(exp.isNull()){
		return;
	}

	// expressió de tipus no comparable
	if(exp.getTSB() == TipusSubjacentBasic::ARRAY){
		driver->error(error_tipus_no_comparable(exp.getTipus()), true);
		return;
	}

	// guardar dades de l'expressió
	this->tsb = exp.getTSB();
    this->tipus = exp.getTipus();

	if(exp.getTSB() == TipusSubjacentBasic::BOOLEAN){
		// afegir etiquetes per gestionar els casos cert i fals
		Label boolEnd = driver->code.addLabel();
		Label trueCase = driver->code.addLabel();
		Label falseCase = driver->code.addLabel();
		this->r = driver->code.addVariable(exp.getTSB());

		// exp = true
		driver->code.addInstruction(new SkipInstruction(trueCase));
		driver->code.backpatch(trueCase, exp.getCert());
		driver->code.addInstruction(new AssignmentInstruction(
			this->r,
			((DescripcioConstant *) driver->ts.consulta("true"))->getVariable()
		));
		driver->code.addInstruction(new GoToInstruction(boolEnd));

		// exp = false
		driver->code.addInstruction(new SkipInstruction(falseCase));
		driver->code.backpatch(falseCase, exp.getFals());
		driver->code.addInstruction(new AssignmentInstruction(
			this->r,
			((DescripcioConstant *) driver->ts.consulta("false"))->getVariable()
		));

		// final
		driver->code.addInstruction(new SkipInstruction(boolEnd));
	}else{
		this->r = exp.dereference(driver, exp.getTSB());
	}

	// pintar a l'arbre
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ")") );

	// també indicar on serà el final del break
	this->fi = driver->code.addLabel();

}

/**
 * contSwitch -> contSwitch default do M0 bloc
 */
void SimbolContSwitch::make(Driver *driver, SimbolContSwitch cont, SimbolBloc bloc, SimbolMarcador m){
	if(cont.teDefault){
		// ja s'ha definit un default prèviament
		driver->error( error_default_definit() , true);
		return;
	}

	this->teDefault = true;

	// continuar propagant els valor de contSwitch
	this->fi = cont.fi;
	this->tsb = cont.tsb;
	this->tipus = cont.tipus;
	this->valors = cont.valors;
	this->r = cont.r;

	// els possibles breaks del bloc han d'anar al final
	// i no s'han de propagar, però sí els returns
	this->propaga(cont, bloc);
	
	driver->code.backpatch(this->fi, this->_breakList);
	this->_breakList.clear();
	this->_conteBreak = false;

	// el case anterior té salts a n'aquest case però no estan
	// definits. És el darrer cas (perquè és default), per tant tant el salt
	// condicional com l'incondicional de l'anterior case ha d'executar el codi
	driver->code.backpatch(m.getLabel(), cont.previousCondJump);
	driver->code.backpatch(m.getLabel(), cont.previousGoTo);

	// i pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "default do") );
    this->fills.push_back( std::to_string(m.getNodeId()) );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * contSwitch -> switchCaseCont do bloc
 */
void SimbolContSwitch::make(Driver *driver, SimbolSwitchCaseCont cont, SimbolBloc bloc){
	// gestionar els breaks
	this->propaga(bloc, cont); // returns

	driver->code.backpatch(cont.getFi(), this->_breakList); // breaks
	this->_breakList.clear();
	this->_conteBreak = false;

	// si el bloc no té cap break, ha de continuar al següent case
	// no es coneix quina és l'etiqueta on s'ha d'anar
	GoToInstruction *inst = new GoToInstruction(Label());
	driver->code.addInstruction(inst);

	// el pròxim case ja s'encarregarà de canviar aquesta instrucció
	this->previousGoTo.push_back(inst); 
	this->previousCondJump = cont.getPreviousCondJump();

	// propagar els valors
	this->tsb = cont.getTSB();
	this->tipus = cont.getTipus();
	this->r = cont.getVariable();
	this->fi = cont.getFi();
	this->valors = cont.getValors();

	// i pintar a l'arbre
    this->fills.push_back( std::to_string(cont.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "do") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
}

std::list<Instruction *> SimbolContSwitch::getPreviousGoTo(){ return this->previousGoTo; }
std::list<Instruction *> SimbolContSwitch::getPreviousCondJump(){ return this->previousCondJump; }
Label SimbolContSwitch::getFi(){ return this->fi; }

Variable *SimbolContSwitch::getVariable(){ return this->r; }
TipusSubjacentBasic SimbolContSwitch::getTSB(){ return this->tsb; }
std::string SimbolContSwitch::getTipus(){ return this->tipus; }
bool SimbolContSwitch::hasDefault(){ return this->teDefault; }
	
std::list<std::shared_ptr<ValueContainer>> SimbolContSwitch::getValors(){ return this->valors; }