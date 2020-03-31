#include "SimbolRelExpr.h"
#include "../Driver.h"

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
void SimbolRelExpr::make(Driver *driver, SimbolExpressio a, SimbolExpressio b, int tipus){
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

    Label lab1;
    Label lab2;

    CondJumpInstruction* cji = new CondJumpInstruction(
        o,
        a.dereference(driver, a.getTSB()),
        b.dereference(driver, b.getTSB()),
        lab1
    );

    GoToInstruction* gti = new GoToInstruction(lab2);

    driver->code.addInstruction(cji);
    driver->code.addInstruction(gti);

    this->ecert.push_back(cji);
    this->efals.push_back(gti);
}