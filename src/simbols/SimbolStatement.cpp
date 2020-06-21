#include "SimbolStatement.h"
#include "SimbolIfStatement.h"
#include "SimbolWhileStatement.h"
#include "SimbolSwitchStatement.h"
#include "../Driver.h"
#include "../code/instructions/GoToInstruction.h"
#include "../code/instructions/ReturnInstruction.h"
#include "../code/instructions/AssignmentInstruction.h"
#include "../code/instructions/SkipInstruction.h"
#include "../code/instructions/MemoryInstruction.h"
#include "../code/Label.h"
#include <iostream>


SimbolStatement::SimbolStatement() : Simbol("Statement"), ControlInstruccions() {}
SimbolStatement::~SimbolStatement() {}

/**
 * statement -> whileStatement
 */
void SimbolStatement::make(Driver *driver, SimbolWhileStatement whileStmt){
    this->propaga(whileStmt);

    // pintar a l'arbre
    this->fills.push_back( std::to_string(whileStmt.getNodeId()) );
    Simbol::toDotFile(driver);

	this->seg = whileStmt.getSeg();
}

/**
 * statement -> forStatement
 */
void SimbolStatement::make(Driver *driver, SimbolForStatement forStmt){
    this->propaga(forStmt);

    // pintar a l'arbre
    this->fills.push_back( std::to_string(forStmt.getNodeId()) );
    Simbol::toDotFile(driver);

	this->seg = forStmt.getSeg();
}

/**
 * statement -> ifStatement
 */
void SimbolStatement::make(Driver *driver, SimbolIfStatement ifStmt){
    this->propaga(ifStmt);

    // pintar a l'arbre
    this->fills.push_back( std::to_string(ifStmt.getNodeId()) );
    Simbol::toDotFile(driver);

	this->seg = ifStmt.getSeg();
}

/**
 * statement -> return exprSimple
 */
void SimbolStatement::make(Driver *driver, SimbolExpressio exp){
    if(exp.isNull()){
        return;
    }
    
    // decrementar els comptadors de referència de tots els punters
    // del subprograma perquè no es gestiona mitjançant els propis blocs
    // només es volen les descripcions del subprograma actual NP >= 1
    // en cas de ser la variable de retorn, no es decrementa
    std::list<Descripcio *> descripcions = driver->ts.getAllSymbols(1);
    std::list<Descripcio *>::iterator it = descripcions.begin();
    while(it != descripcions.end()){
        Descripcio *d = *it;

        if(d->getTipus() == Descripcio::Tipus::VARIABLE){
            DescripcioVariable *dv = (DescripcioVariable *) d;
            DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(dv->getNomTipus());
            if(!dv->getVariable()->isParameter() 
                && dv->getVariable() != exp.getBase()
                && dt->getTSB() == TipusSubjacentBasic::POINTER){
                driver->code.addInstruction(new MemoryInstruction(
                    dv->getVariable(),
                    MemoryInstruction::Type::DECREMENT
                ));
            }
        }else if(d->getTipus() == Descripcio::Tipus::CONSTANT){
            DescripcioConstant *dc = (DescripcioConstant *) d;
            DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(dc->getNomTipus());
            if(!dc->getVariable()->isParameter() 
                && dc->getVariable() != exp.getBase()
                && dt->getTSB() == TipusSubjacentBasic::POINTER){
                driver->code.addInstruction(new MemoryInstruction(
                    dc->getVariable(),
                    MemoryInstruction::Type::DECREMENT
                ));
            }
        }


        it++;
    }

    // s'ha d'inserir el return dins la llista de returns
    struct ControlInstruccions::ReturnData tmp;
    tmp.tipus = exp.getTipus();
    tmp.tsb = exp.getTSB();
    tmp.loc = driver->getLocation();

	if(exp.getTSB() == TipusSubjacentBasic::BOOLEAN){
		// per simplificar un poc la gestió, s'assignarà el valor boolean
		// a una variable temporal
		Label *caseTrue = driver->code.addLabel();
		Label *caseFalse = driver->code.addLabel();
		Label *end = driver->code.addLabel();

		Variable *valor = driver->code.addVariable(TipusSubjacentBasic::BOOLEAN);

		// cas true
		driver->code.addInstruction(new SkipInstruction(caseTrue));
		driver->code.backpatch(caseTrue, exp.getCert());
		driver->code.addInstruction(new AssignmentInstruction(
			valor,
			((DescripcioConstant *) driver->ts.consulta("true"))->getVariable()
		));
		driver->code.addInstruction(new GoToInstruction(end));

		// cas false
		driver->code.addInstruction(new SkipInstruction(caseFalse));
		driver->code.backpatch(caseFalse, exp.getFals());
		driver->code.addInstruction(new AssignmentInstruction(
			valor,
			((DescripcioConstant *) driver->ts.consulta("false"))->getVariable()
		));

		// final i crear la instrucció de retorn
		driver->code.addInstruction(new SkipInstruction(end));
		tmp.returnInst = new ReturnInstruction(nullptr, valor);
	}else{
		tmp.returnInst = new ReturnInstruction(nullptr, exp.dereference(driver, exp.getTSB()));
	}

	driver->code.addInstruction(tmp.returnInst);

    this->_returns.push_back(tmp);

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "return") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * statement -> break
 */
void SimbolStatement::make(Driver *driver, SimbolStatement::Tipus tipus){
    if(tipus == SimbolStatement::Tipus::BREAK){
        this->_conteBreak = true;

		// generar un goto incondicial
		GoToInstruction *inst = new GoToInstruction(nullptr);
		driver->code.addInstruction(inst);
		this->_breakList.push_back(inst);
    }

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "break") );
    Simbol::toDotFile(driver);
}

/**
 * statement -> expression
 */
void SimbolStatement::make(Driver *driver, SimbolAssignacio exp){
    // pintar a l'arbre
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * statement -> subProgramCall
 */
void SimbolStatement::make(Driver *driver, SimbolSubProgramCall call){
    // pintar a l'arbre
    this->fills.push_back( std::to_string(call.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * statement -> switchStatement
 */
void SimbolStatement::make(Driver *driver, SimbolSwitchStatement switchStmt){
    this->propaga(switchStmt);
    // pintar a l'arbre
    this->fills.push_back( std::to_string(switchStmt.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * statement -> varDecl
 */
void SimbolStatement::make(Driver *driver, SimbolVarDecl decl){
    // pintar a l'arbre
    this->fills.push_back( std::to_string(decl.getNodeId()) );
    Simbol::toDotFile(driver);
}

std::list<Instruction * > SimbolStatement::getSeg() {
    return this->seg;
}