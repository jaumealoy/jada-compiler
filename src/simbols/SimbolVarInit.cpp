#include "SimbolVarInit.h"
#include "../taulasimbols/Descripcio.h"
#include "../Driver.h"
#include "../code/instructions/GoToInstruction.h"
#include "../code/instructions/SkipInstruction.h"
#include "../code/instructions/AssignmentInstruction.h"

SimbolVarInit::SimbolVarInit() : SimbolExpressio() {
    this->nomNode = "VarInit";
}

SimbolVarInit::~SimbolVarInit(){}

/**
 * varInit -> = exprSimple
 */
void SimbolVarInit::make(Driver *driver, SimbolExpressio exp){
    this->tipus = exp.getTipus();
    this->tsb = exp.getTSB();
    this->mode = exp.getMode();

    this->intValue = exp.getIntValue();
    this->charValue = exp.getCharValue();
    this->boolValue = exp.getBoolValue();

	// el valor de l'expressió es propaga
	this->value = exp.getValue();

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "=") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    Simbol::toDotFile(driver);

	// en cas de ser una expressió boolean, s'ha d'indicar 
	// el final de l'etiquetes de cert i fals
	if(exp.getTSB() == TipusSubjacentBasic::BOOLEAN){
		// no té una variable assignada
		this->r = driver->code.addVariable(TipusSubjacentBasic::BOOLEAN);
		this->d = nullptr;

		// generar les etiquetes
		Label *eCert = driver->code.addLabel();
		driver->code.backpatch(eCert, exp.getCert());

		Label *eFals = driver->code.addLabel();
		driver->code.backpatch(eFals, exp.getFals());

		Label *eFinal = driver->code.addLabel();

		// guardar dins la variable el valor de l'expressió boolean
		driver->code.addInstruction(new SkipInstruction(eCert));
		driver->code.addInstruction(new AssignmentInstruction(
			this->r,
			((DescripcioConstant *) driver->ts.consulta("true"))->getVariable()
		));
		driver->code.addInstruction(new GoToInstruction(eFinal));

		driver->code.addInstruction(new SkipInstruction(eFals));
		driver->code.addInstruction(new AssignmentInstruction(
			this->r,
			((DescripcioConstant *) driver->ts.consulta("false"))->getVariable()
		));

		driver->code.addInstruction(new SkipInstruction(eFinal));
	}else{
		// copiar dades de variables
		this->r = exp.getBase();
		this->d = exp.getOffset();
	}
}

/**
 * varInit -> = arrayInit
 */
void SimbolVarInit::make(Driver *driver, SimbolArrayInit exp){
    this->tipus = exp.getTipus();
    this->tsb = exp.getTSB();
    this->mode = exp.getMode();

	// el valor és un punter a una seqüència d'elements del mateix tipus
	this->value = exp.getValue();
	this->r = exp.getBase();
	this->d = exp.getOffset();

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "=") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    Simbol::toDotFile(driver);
}


/**
 * varInit -> lambda
 */
void SimbolVarInit::make(Driver *driver){
    this->makeEmpty();
    Simbol::toDotFile(driver);

	// no hi ha cap variable associada
	this->r = nullptr;
	this->d = nullptr;
}