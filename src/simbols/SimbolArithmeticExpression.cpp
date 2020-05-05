#include "SimbolArithmeticExpression.h"
#include "../Driver.h"

#include "../code/instructions/ArithmeticInstruction.h"
#include "../code/instructions/AssignmentInstruction.h"

SimbolArithmeticExpression::SimbolArithmeticExpression() : SimbolExpressio() {
    this->nomNode = "ArithmeticExpression";
}

SimbolArithmeticExpression::~SimbolArithmeticExpression(){}

/**
 * aritExpr -> - exprSimple
 */
void SimbolArithmeticExpression::make(Driver *driver, SimbolExpressio exp){
    if(exp.isNull()){
        this->makeNull();
        return;
    }

    if(exp.getTSB() != TipusSubjacentBasic::INT){
        this->makeNull();
        driver->error( error_tipus_esperat("enter") );
        return;
    }

    if(exp.getMode() == SimbolExpressio::Mode::CONST){
		int valor = - *(int *) exp.getValue()->get();

		// no es pot reutilitzar el contenedor
		this->value = std::make_shared<ValueContainer>((const char *) &valor, sizeof(int));
    }

    this->mode = exp.getMode();
    this->tsb = TipusSubjacentBasic::INT;
    this->tipus.clear();

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "-") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    Simbol::toDotFile(driver);

	// generació de codi
	// obtenir el valor de l'expressió
	Variable *expValor = exp.dereference(driver, TipusSubjacentBasic::INT);

	this->r = driver->code.addVariable(TipusSubjacentBasic::INT);
	this->d = nullptr;

	int valor = 0;
	Variable *tmp = driver->code.addVariable(TipusSubjacentBasic::INT);
	driver->code.addInstruction(new AssignmentInstruction(
		TipusSubjacentBasic::INT,
		tmp,
		std::make_shared<ValueContainer>((const char *) &valor, sizeof(int))
	));

	// es podria fer d'altres maneres però seran les optimitzacions les
	// encarregades de convertir aquesta operació en un canvi de signe
	driver->code.addInstruction(new ArithmeticInstruction(
		ArithmeticInstruction::Type::SUBTRACTION,
		this->r,
		tmp,
		expValor
	));
}

/**
 * aritExpr -> exprSimple + exprSimple
 * aritExpr -> exprSimple - exprSimple
 * aritExpr -> exprSimple * exprSimple
 * aritExpr -> exprSimple / exprSimple
 * aritExpr -> exprSimple % exprSimple
 */
void SimbolArithmeticExpression::make(Driver *driver, SimbolExpressio a, SimbolExpressio b, int tipus){
    if(a.isNull() || b.isNull()){
        this->makeNull();
        return;
    }

    // només es poden fer operacions aritmètiques entre enters
    if(a.getTSB() != TipusSubjacentBasic::INT || b.getTSB() != TipusSubjacentBasic::INT){
        this->makeNull();
        driver->error( error_tipus_esperat("enter") );
        return;
    }

	ArithmeticInstruction::Type operation;
	switch (tipus) {
		case 0: operation = ArithmeticInstruction::Type::ADDITION; break;
		case 1: operation = ArithmeticInstruction::Type::SUBTRACTION; break;
		case 2: operation = ArithmeticInstruction::Type::MULTIPLICATION; break;
		case 3: operation = ArithmeticInstruction::Type::DIVISION; break;
		case 4: operation = ArithmeticInstruction::Type::MOD; break;
	}

    // calcular el resultat si és constant
    if(a.getMode() == b.getMode() && a.getMode() == SimbolExpressio::Mode::CONST){
		int valorA = *(int *) a.getValue()->get();
		int valorB = *(int *) b.getValue()->get();
		int resultat;

        switch (tipus) {
            case 0: // exprSimple + exprSimple
                resultat = valorA + valorB;
                break;
            
            case 1: // exprSimple - exprSimpe
                resultat = valorA - valorB;
                break;

            case 2: // exprSimple * exprSimpe
                resultat = valorA * valorB;
                break;

            case 3: // exprSimple / exprSimpe
                if(b.getMode() == CONST && valorB == 0){
                    driver->error( error_divisio_zero() );
                    this->makeNull();
                    return;
                }

                resultat = valorA / valorB;
                break;
            
            case 4: // exprSimple % exprSimple:
                if(valorB == 0){
                    driver->error( error_divisio_zero() );
                    this->makeNull();
                    return;
                }

                resultat = valorA % valorB;
                break;
        }

		// és un nou valor, no es pot reutilitzar el contenedor antic
		this->value = std::make_shared<ValueContainer>((const char *) &resultat, sizeof(int));

        this->mode = SimbolExpressio::Mode::CONST;
    }else{
        this->mode = SimbolExpressio::Mode::RESULTAT;
    }

    this->tsb = TipusSubjacentBasic::INT;
    this->tipus.clear();

    // pintar a l'arbre
    this->fills.push_back( std::to_string(a.getNodeId()) );
    switch (tipus) {
        case 0: this->fills.push_back( driver->addTreeChild(this, "+") ); break;
        case 1: this->fills.push_back( driver->addTreeChild(this, "-") ); break;
        case 2: this->fills.push_back( driver->addTreeChild(this, "*") ); break;
        case 3: this->fills.push_back( driver->addTreeChild(this, "/") ); break;
        case 4: this->fills.push_back( driver->addTreeChild(this, "%") ); break;
    }
    this->fills.push_back( std::to_string(b.getNodeId()) );
    Simbol::toDotFile(driver);

	// generació de codi
	this->r = driver->code.addVariable(this->tsb);
	Variable *r1 = a.dereference(driver, a.getTSB());
	Variable *r2 = b.dereference(driver, b.getTSB());
	driver->code.addInstruction(new ArithmeticInstruction(operation, this->r, r1, r2));

	this->d = nullptr;
}