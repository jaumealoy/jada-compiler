#include "SimbolAssignacio.h"
#include "../Driver.h"

#include "../code/instructions/AssignmentInstruction.h"

SimbolAssignacio::SimbolAssignacio() : Simbol("Assignació"){}
SimbolAssignacio::~SimbolAssignacio(){}

/**
 * Les següents expressions no tenen un valor de tornada
 * 
 * expression -> referencia = exprSimple
 * expression -> referencia += exprSimple
 * expression -> referencia /= exprSimple
 * expression -> referencia *= exprSimple
 * expression -> referencia -= exprSimple
 */
void SimbolAssignacio::make(Driver *driver, SimbolReferencia ref, SimbolExpressio exp, int tipus){
    if(ref.isNull() || exp.isNull()){
        return;
    }

    // Comprovar que la referència és una variable
    if(ref.getMode() != SimbolReferencia::ModeMVP::VAR){
        driver->error( error_no_variable(ref.getId()) );
        return;
    }

    // Comprovar que els tipus de referència i exprSimple són compatibles
    if(ref.getTipus() != exp.getTipus() && !ref.getTipus().empty() && !exp.getTipus().empty()){
        driver->error( error_tipus_no_compatibles(ref.getTipus(), exp.getTipus()) );
        return;
    }else{
        if(ref.getTSB() != exp.getTSB()){
            driver->error( error_tipus_no_compatibles(ref.getTSB(), exp.getTSB()) );
            return;
        }
    }

    // i pintar a l'arbre
    std::string operadors[] = {"=", "+=", "/=", "*=", "-="};
    this->fills.push_back( std::to_string(ref.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, operadors[tipus]) );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    Simbol::toDotFile(driver);

	// generació de codi intermedi
	switch(tipus){
		case 0: // ref = exprSimple
			if(ref.getOffset().isNull()){
				// no existeix desplaçament en temps de compilació
				Variable tmp = exp.dereference(driver);
				driver->code.addInstruction(new AssignmentInstruction(ref.getBase(), tmp));
			}else{

			}
			break;
		
	}
}

/**
 * expression -> referencia-- (tipus 1)
 * expression -> referencia++ (tipus 0)
 */
void SimbolAssignacio::make(Driver *driver, SimbolReferencia ref, int tipus){
    if(ref.isNull()){
        // ja s'haurà mostrat l'error a qualque altre banda
        return;
    }

    // Comprovar que la referència és una variable
    if(ref.getMode() != SimbolReferencia::ModeMVP::VAR){
        driver->error( error_no_variable(ref.getId()) );
        return;
    }

    // només és possible amb enters
    if(ref.getTSB() != TipusSubjacentBasic::INT){
        driver->error( error_tipus_no_compatibles_operador(ref.getTSB()) );
    }

    // i pintar a l'arbre
    std::string operadors[] = {"++", "--"};
    this->fills.push_back( std::to_string(ref.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, operadors[tipus]) );
    Simbol::toDotFile(driver);
}

/**
 * expression -> referencia = arrayInit
 */
void SimbolAssignacio::make(Driver *driver, SimbolReferencia ref, SimbolArrayInit arrayInit){
    if(ref.isNull() || arrayInit.isNull()){
        return;
    }

    // Comprovar que la referència és una variable
    if(ref.getMode() != SimbolReferencia::ModeMVP::VAR){
        driver->error( error_no_variable(ref.getId()) );
        return;
    }

    // El tipus d'arrayInit tendrà un tipus associat, per tant
    // la comprovació haurà ser forta
    if(ref.getTipus().empty() || ref.getTipus() != arrayInit.getTipus()){
        driver->error( error_tipus_no_compatibles(arrayInit.getTipus()) );
        return;
    }

    // i pintar a l'arbre
    this->fills.push_back( std::to_string(ref.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "=") );
    this->fills.push_back( std::to_string(arrayInit.getNodeId()) );
    Simbol::toDotFile(driver);
}