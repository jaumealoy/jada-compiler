#include "SimbolContSwitch.h"
#include "../Driver.h"
#include "../code/instructions/CondJumpInstruction.h"
#include "../code/instructions/GoToInstruction.h"


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
	this->r = exp.dereference(driver);

	// pintar a l'arbre
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ")") );

	// també indicar on serà el final del break
	this->fi = driver->code.addLabel();
}

/**
 * contSwitch -> default do M0 bloc
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
	this->propaga(bloc);
	
	driver->code.backpatch(this->fi, this->_breakList);
	this->_breakList.clear();
	this->_conteBreak = false;

	// el case anterior té salts a n'aquest case però no estan
	// definits. És el darrer cas (perquè és default), per tant tant el salt
	// condicional com l'incondicional de l'anterior case ha d'executar el codi
	if(cont.previousCondJump != nullptr){
		driver->code.backpatch(m.getLabel(), cont.previousCondJump);
	}

	if(cont.previousGoTo != nullptr){
		driver->code.backpatch(m.getLabel(), cont.previousGoTo);
	}

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
	this->propaga(bloc);
	this->_conteBreak = false;
	driver->code.backpatch(cont.getFi(), this->_breakList);

	// si el bloc no té cap break, ha de continuar al següent case
	// no es coneix quina és l'etiqueta on s'ha d'anar
	GoToInstruction *inst = new GoToInstruction(Label());
	driver->code.addInstruction(inst);

	// el pròxim case ja s'encarregarà de canviar aquesta instrucció
	this->previousGoTo = inst; 
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

Instruction * SimbolContSwitch::getPreviousGoTo(){ return this->previousGoTo; }
Instruction * SimbolContSwitch::getPreviousCondJump(){ return this->previousCondJump; }
Label SimbolContSwitch::getFi(){ return this->fi; }

Variable SimbolContSwitch::getVariable(){ return this->r; }
TipusSubjacentBasic SimbolContSwitch::getTSB(){ return this->tsb; }
std::string SimbolContSwitch::getTipus(){ return this->tipus; }
bool SimbolContSwitch::hasDefault(){ return this->teDefault; }
	
std::list<std::shared_ptr<ValueContainer>> SimbolContSwitch::getValors(){ return this->valors; }


/**
 * Part principal de l'switch començant amb un default
 * ContSwitch -> exprSimple ) begin default begin bloc end
 *//*
void SimbolContSwitch::make(Driver *driver, SimbolExpressio exp, SimbolBloc bloc) {
    //Propagar el return i els breaks
    this->propaga(bloc);

    this->teDefault = true;

    //Asignació del resultat de l'expressió
    this->tsb = exp.getTSB();
    this->tipus = exp.getTipus();

    // pintar a l'arbre
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ") begin default begin") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end ") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    Simbol::toDotFile(driver);
}*/

/**
 * Part principal de l'switch començant amb un case
 * ContSwitch -> exprSimple ) begin case exprSimple begin bloc end
 *//*
void SimbolContSwitch::make(Driver *driver, SimbolExpressio exp1, SimbolExpressio exp2, SimbolBloc bloc) {
    //Propagar returns i breaks
    this->propaga(bloc);

    this->teDefault = false;

    if (exp1.isNull() || exp2.isNull()) {
        return;
    }

    if (exp1.getTSB() == ARRAY) {
        driver->error(error_tipus_no_comparable(exp1.getTipus()), true);
        return;
    }

    if (exp2.getTSB() != exp1.getTSB()) {
        this->tsb = exp1.getTSB();
        driver->error(error_tipus_no_compatibles(exp1.getTSB(), exp2.getTSB()), true);
        return;
    }

    if (exp2.getMode() != SimbolExpressio::CONST) {
        driver->error(error_valor_no_constant(), true);
        return;
    }

    switch (exp2.getTSB()) {
        case INT: 
            this->valors.push_back(exp2.getIntValue());
            break;
        case CHAR: 
            this->valors.push_back((int) exp2.getCharValue());
            break;
        case BOOLEAN: 
            this->valors.push_back((int) exp2.getBoolValue());
            break;
    }

    this->tsb = exp1.getTSB();
    this->tipus = exp1.getTipus();

    // pintar a l'arbre
    this->fills.push_back( std::to_string(exp1.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ") begin case ") );
    this->fills.push_back( std::to_string(exp2.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "begin ") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end ") );
    Simbol::toDotFile(driver);
}*/

/**
 * ContSwitch -> contSwitch default begin bloc end
 *//*
void SimbolContSwitch::make(Driver *driver, SimbolContSwitch cont, SimbolBloc bloc) {
    //Propagar el return i els breaks
    this->propaga(bloc);

    if (cont.teDefault) {
        this->tsb = cont.tsb;
        driver->error(error_default_definit(), true);
        return;
    }
    this->teDefault = true;

    //Asignació del resultat de l'expressió
    this->tsb = cont.tsb;
    this->tipus = cont.tipus;
    this->valors = cont.valors;

    // pintar a l'arbre
    this->fills.push_back( std::to_string(cont.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "default begin") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end ") );
    Simbol::toDotFile(driver);
}*/

/**
 * contSwitch -> contSwitch case exprSimple begin bloc end
 *//*
void SimbolContSwitch::make(Driver *driver, SimbolContSwitch cont, SimbolExpressio exp, SimbolBloc bloc) {
    this->propaga(bloc);

    int valor;

    if (exp.isNull()) {
        return;
    }

    if (exp.getTSB() != cont.tsb) {
        this->tsb = cont.tsb;
        driver->error(error_tipus_no_compatibles(exp.getTSB(), cont.tsb), true);
        return;
    }

    if (exp.getMode () != SimbolExpressio::CONST) {
        this->tsb = cont.tsb;
        driver->error(error_valor_no_constant());
        return;
    }    

    switch (exp.getTSB()) {
        case INT:
            valor = exp.getIntValue();
            break;
        case CHAR: 
            valor = (int) exp.getCharValue();
            break;
        case BOOLEAN: 
            valor = (int) exp.getBoolValue();
            break;
    } 

    this->valors = cont.valors;
    for (int i = 0; i < valors.size(); i++) {
        if (valor == valors[i]) {
            driver->error(error_case_definit(std::to_string(valors[i])));
            return;
        }
    }
    valors.push_back(valor);

    this->teDefault = cont.teDefault;
    this->tsb = cont.tsb;
    this->tipus = cont.tipus;

    // pintar a l'arbre
    this->fills.push_back( std::to_string(cont.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "case") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "begin") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end ") );
    Simbol::toDotFile(driver);
}*/