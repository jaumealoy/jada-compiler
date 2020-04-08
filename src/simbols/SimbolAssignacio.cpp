#include "SimbolAssignacio.h"
#include "../Driver.h"

#include "../code/instructions/AssignmentInstruction.h"
#include "../code/instructions/SkipInstruction.h"
#include "../code/instructions/ArithmeticInstruction.h"

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
			Variable *tmp = exp.dereference(driver, exp.getTSB());

			if(exp.getTSB() == TipusSubjacentBasic::BOOLEAN){
				// és un boolean, s'haurà fet qualque salt condicional
				Label ec = driver->code.addLabel();
                Label ef = driver->code.addLabel();
                Label efi = driver->code.addLabel();

                driver->code.addInstruction(new SkipInstruction(ec));
                driver->code.backpatch(ec, exp.getCert());
                DescripcioConstant* c = (DescripcioConstant *) driver->ts.consulta("true");
                DescripcioConstant* f = (DescripcioConstant *) driver->ts.consulta("false");
                if (ref.getOffset() == nullptr) {
                    driver->code.addInstruction(new AssignmentInstruction(ref.getBase(), c->getVariable()));
                } else {
                    driver->code.addInstruction(new AssignmentInstruction(
                        AssignmentInstruction::Type::TARGET_OFF,
                        ref.getBase(),
                        c->getVariable(),
                        ref.getOffset()                        
                    ));
                }
                driver->code.addInstruction(new GoToInstruction(efi));
                driver->code.addInstruction(new SkipInstruction(ef));
                driver->code.backpatch(ef, exp.getFals());
                if (ref.getOffset() == nullptr) {
                    driver->code.addInstruction(new AssignmentInstruction(ref.getBase(), f->getVariable()));
                } else {
                    driver->code.addInstruction(new AssignmentInstruction(
                        AssignmentInstruction::Type::TARGET_OFF,
                        ref.getBase(),
                        f->getVariable(),
                        ref.getOffset() 
                    ));
                }
                driver->code.addInstruction(new SkipInstruction(efi));
			}else{
				if(ref.getOffset() == nullptr){
					// no existeix desplaçament en temps de compilació
					driver->code.addInstruction(new AssignmentInstruction(ref.getBase(), tmp));
				}else{
					// és una assignació de l'estil a[c] = b
					driver->code.addInstruction(new AssignmentInstruction(
						AssignmentInstruction::Type::TARGET_OFF,
						ref.getBase(),
						tmp,
						ref.getOffset()
					));
				}
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