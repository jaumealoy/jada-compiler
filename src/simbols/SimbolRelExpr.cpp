#include "SimbolRelExpr.h"
#include "../Driver.h"

#include "../code/instructions/AssignmentInstruction.h"
#include "../code/instructions/SkipInstruction.h"
#include "../code/instructions/CondJumpInstruction.h"

SimbolRelExpr::SimbolRelExpr() : SimbolExpressio() {}
SimbolRelExpr::~SimbolRelExpr() {}

/**
 *  RelExpr -> ExprSimple [OP_NEQ/OP_EQ/OP_GT...] ExprSimple
 * 
 * tipus = 0 (NEQ)
 *         1 (EQ)
 *         2 (GT)
 *         3 (GTE)
 *         4 (LT)
 *         5 (LTE)
 */
void SimbolRelExpr::make(Driver *driver, SimbolExpressio a, SimbolExpressio b, int tipus, SimbolMarcador m){
    if (a.isNull() || b.isNull()) {
        //Ignorar
        this->makeNull();
        return;
    }

    if ((a.getTSB() != INT) && (a.getTSB() != CHAR) && (a.getTSB() != BOOLEAN)) {     
        driver->error( error_tipus_no_comparable() );
    }

    if ((b.getTSB() != INT) && (b.getTSB() != CHAR) && (b.getTSB() != BOOLEAN)) {     
        driver->error( error_tipus_no_comparable() );
    }    

    if (a.getTSB() != b.getTSB()) {
        driver->error( error_tipus_no_comparable(a.getTSB(), b.getTSB()) );
    }

    if (!(a.getTipus().empty() || b.getTipus().empty())) {
        if (a.getTipus() != b.getTipus()) {
            driver-> error( error_tipus_no_comparable(a.getTipus(), b.getTipus()) );
        }
    }

    TipusSubjacentBasic tmp = a.getTSB();

    // calcular el valor resultant si les dues expressions són constants
    if(a.getMode() == b.getMode() && a.getMode() == SimbolExpressio::Mode::CONST){
		bool tmpValue;

        switch (tipus) {
            case 0:  // NEQ
                switch (tmp) {
                    case BOOLEAN:
                        tmpValue = *(bool *) a.getValue()->get() != *(bool *) b.getValue()->get();
                        break;
                    case INT:
                        tmpValue = *(int *) a.getValue()->get() != *(int *) b.getValue()->get();
                        break;
                }
                break;
            
            case 1: // EQ
                switch (tmp) {
                    case BOOLEAN:
                        tmpValue = *(bool *) a.getValue()->get() == *(bool *) b.getValue()->get();
                        break;
                    case INT:
                        tmpValue = *(int *) a.getValue()->get() == *(int *) b.getValue()->get();
                        break;
                }

                break;

            case 2: // GT
                switch (tmp) {
                    case BOOLEAN:
                        tmpValue = *(bool *) a.getValue()->get() > *(bool *) b.getValue()->get();
						break;
                    case INT:
                        tmpValue = *(int *) a.getValue()->get() > *(int *) b.getValue()->get();
						break;
                }

                break;

            case 3: // GTE
                switch (tmp) {
                    case BOOLEAN:
                        tmpValue = *(bool *) a.getValue()->get() >= *(bool *) b.getValue()->get();
                        break;
                    case INT:
                        tmpValue = *(int *) a.getValue()->get() >= *(int *) b.getValue()->get();
                        break;
                }

                break;
            
            case 4: // LT
                switch (tmp) {
                    case BOOLEAN:
                        tmpValue = *(bool *) a.getValue()->get() < *(bool *) b.getValue()->get();
						break;
                    case INT:
                        tmpValue = *(int *) a.getValue()->get() < *(int *) b.getValue()->get();
                        break;
                }

                break;

            case 5: // LTE
                switch (tmp) {
                    case BOOLEAN:
                        tmpValue = *(bool *) a.getValue()->get() <= *(bool *) b.getValue()->get();
                        break;
                    case INT:
                        tmpValue = *(int *) a.getValue()->get() <= *(int *) b.getValue()->get();
                        break;
                }

                break;
        }

		this->value = std::make_shared<ValueContainer>((const char *) &tmpValue, sizeof(bool));
    }else{
        this->mode = SimbolExpressio::Mode::RESULTAT;
    }
    
    this->tipus.clear();
    this->tsb = BOOLEAN;

    // pintar a l'arbre
    std::string operadors[] = { "!=", "==", ">", ">=", "<", "<=" };
    this->fills.push_back( std::to_string(a.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, operadors[tipus]) );
    this->fills.push_back( std::to_string(b.getNodeId()) );
    Simbol::toDotFile(driver);

    // generacio de codi intermedi
    CondJumpInstruction::Operator o;
    
    switch (tipus) {
        case 0: o = CondJumpInstruction::Operator::NEQ ; break;
        case 1: o = CondJumpInstruction::Operator::EQ ; break;
        case 2: o = CondJumpInstruction::Operator::GT ; break;
        case 3 : o = CondJumpInstruction::Operator::GTE ; break;
        case 4 : o = CondJumpInstruction::Operator::LT ; break;
        case 5 : o = CondJumpInstruction::Operator::LTE ; break;
    }

	Variable *varA;
	Variable *varB;

	if(a.getTSB() == TipusSubjacentBasic::BOOLEAN){
		// a i b són booleans, no tenen una variable assignada
		// per simplificar la gestió, es crearà una variable temporal que 
		// guardi el valor d'a i b

		Instruction *endB = driver->code.addInstruction(new SkipInstruction(Label()));	

		// cas A
		Label aCert = driver->code.addLabel();
		Label aFals = driver->code.addLabel();
		Label aFinal = driver->code.addLabel();
		varA = driver->code.addVariable(TipusSubjacentBasic::BOOLEAN);

		driver->code.addInstruction(new SkipInstruction(aCert));
		driver->code.backpatch(aCert, a.getCert());
		driver->code.addInstruction(new AssignmentInstruction(
			varA,
			((DescripcioConstant *) driver->ts.consulta("true"))->getVariable()
		));
		driver->code.addInstruction(new GoToInstruction(aFinal));

		driver->code.addInstruction(new SkipInstruction(aFals));
		driver->code.backpatch(aFals, a.getFals());
		driver->code.addInstruction(new AssignmentInstruction(
			varA,
			((DescripcioConstant *) driver->ts.consulta("false"))->getVariable()
		));

		Instruction *endA = driver->code.addInstruction(new SkipInstruction(aFinal));

		// per no haver d'implementar totes les possibles combinacions entre a i b
		// i per així com es genera el codi, es mourà el codi
		driver->code.move(m.getInstruction(), endB, endA);

		// eliminar instruccions
		driver->code.remove(m.getInstruction());
		driver->code.remove(endB);

		// cas B
		Label bCert = driver->code.addLabel();
		Label bFals = driver->code.addLabel();
		Label bFinal = driver->code.addLabel();
		varB = driver->code.addVariable(TipusSubjacentBasic::BOOLEAN);

		driver->code.addInstruction(new SkipInstruction(bCert));
		driver->code.backpatch(bCert, b.getCert());
		driver->code.addInstruction(new AssignmentInstruction(
			varB,
			((DescripcioConstant *) driver->ts.consulta("true"))->getVariable()
		));
		driver->code.addInstruction(new GoToInstruction(bFinal));

		driver->code.addInstruction(new SkipInstruction(bFals));
		driver->code.backpatch(bFals, b.getFals());
		driver->code.addInstruction(new AssignmentInstruction(
			varB,
			((DescripcioConstant *) driver->ts.consulta("false"))->getVariable()
		));

		driver->code.addInstruction(new SkipInstruction(bFinal));
	}else{
		varA = a.dereference(driver, a.getTSB());
		varB = b.dereference(driver, b.getTSB());

		// eliminar instrucció falsa
		driver->code.remove(m.getInstruction());
	}

    Label lab1;
    Label lab2;

    CondJumpInstruction* cji = new CondJumpInstruction(
        o,
        varA,
        varB,
        lab1
    );

    GoToInstruction* gti = new GoToInstruction(lab2);

    driver->code.addInstruction(cji);
    driver->code.addInstruction(gti);

    this->ecert.push_back(cji);
    this->efals.push_back(gti);
}