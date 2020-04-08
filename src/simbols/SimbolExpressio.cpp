#include "SimbolExpressio.h"
#include "SimbolRelExpr.h"
#include "SimbolArithmeticExpression.h"
#include "../Driver.h"
#include "../code/Reference.h"
#include "../code/instructions/CondJumpInstruction.h"
#include "../code/instructions/GoToInstruction.h"
#include "../code/instructions/AssignmentInstruction.h"
#include "../code/instructions/ArithmeticInstruction.h"

/**
 * L'operació de dues expressions constants dona lloc a una expressió constant
 * Si alguna d'elles és una expressió variable o resultat, serà una 
 * expressió variable o resultat.
 */

SimbolExpressio::SimbolExpressio() : Simbol("Expressió") {
    this->mode = SimbolExpressio::Mode::NUL;
}
SimbolExpressio::~SimbolExpressio(){}

/**
 * exprSimple -> literal
 */
void SimbolExpressio::make(Driver *driver, SimbolLiteral literal){
    // copiar el tipus i tipus subjacent bàsic del literal
    this->tipus = literal.getTipus();
    this->tsb = literal.getTSB();
 
	// guardar el valor, el literal ja s'haurà encarregat de guardar-ho
	// així com toca en funció del seu TSB
	this->value = literal.getValue();

    // prové d'un literal, és una expressió constant
    this->mode = SimbolExpressio::Mode::CONST;

    // i pintar a l'arbre
    this->fills.push_back( std::to_string(literal.getNodeId()) );
    Simbol::toDotFile(driver);

	//generació de codi
	if(literal.getTSB() == TipusSubjacentBasic::ARRAY){
		if(literal.getTipus() == "string"){
			this->r = driver->code.addVariable(literal.getTSB());
			this->d = nullptr;

			// indicar l'ocupació de la variable
			DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(literal.getTipus());
			this->r->setOcupacioExtra(((DescripcioTipusArray *) dt)->getOcupacio());

			// inicialitzar l'string amb el valor adequat
			// valors constants
			Variable *unitat = driver->code.addVariable(TipusSubjacentBasic::INT);
			int valor = 1;
			driver->code.addInstruction(new AssignmentInstruction(
				TipusSubjacentBasic::INT,
				unitat,
				std::make_shared<ValueContainer>((const char*) &valor, sizeof(int))
			));

			// desplaçament sobre l'string
			Variable *offset = driver->code.addVariable(TipusSubjacentBasic::INT);
			valor = 0;
			driver->code.addInstruction(new AssignmentInstruction(
				TipusSubjacentBasic::INT,
				offset,
				std::make_shared<ValueContainer>((const char*) &valor, sizeof(int))
			));

			// valor actual
			Variable *valorCaracter = driver->code.addVariable(TipusSubjacentBasic::CHAR);
			std::shared_ptr<ValueContainer> valorString = literal.getValue();
			char *str = valorString->get();
					
			for(int i = 0; i < valorString->getSize(); i++){
				// guardar el caràcter actual dins valor
				driver->code.addInstruction(new AssignmentInstruction(
					TipusSubjacentBasic::CHAR,
					valorCaracter,
					std::make_shared<ValueContainer>(&str[i], sizeof(char))
				));

				// i guardar dins l'array (string)
				driver->code.addInstruction(new AssignmentInstruction(
					AssignmentInstruction::Type::TARGET_OFF,
					this->r,
					valorCaracter,
					offset
				));

				// incrementar l'offset
				driver->code.addInstruction(new ArithmeticInstruction(
					ArithmeticInstruction::Type::ADDITION,
					offset,
					offset,
					unitat
				));
			}
		}else{
			// no pot ser cap altre cas
		}
	}else{
		this->r = driver->code.addVariable(literal.getTSB());
		this->d = nullptr;
	
		driver->code.addInstruction(new AssignmentInstruction(this->tsb, this->r, this->value));
	}
}


/**
 * exprSimple -> not exprSimple
 * exprSimple -> ( exprSimple )
 */
void SimbolExpressio::make(Driver *driver, SimbolExpressio exp, int tipus){
    if(exp.isNull()){
        this->makeNull();
        return;
    }

    // Copiar informació del mode i tipus
    this->mode = exp.getMode();
    this->tipus = exp.getTipus();
    this->tsb = exp.getTSB();

    switch (tipus) {
        case 0: { // exprSimple -> not exprSimple
            // comprovar que exprSimple és un boolean
            if(exp.getTSB() != TipusSubjacentBasic::BOOLEAN){
                driver->error( error_tipus_esperat(TipusSubjacentBasic::BOOLEAN) );
                this->makeNull();
            }

            if(exp.getMode() == SimbolExpressio::Mode::CONST){
                // processar el valor
				// és un nou valor, guardar un nou espai de memòria
				bool tmpValue = ! *(bool *) exp.value->get();
				this->value = std::make_shared<ValueContainer>((const char *) &tmpValue, sizeof(bool));
            }

			// canviar les coes d'instruccions
			// els salts a cert ara van a fals, i al revés
			std::vector<Instruction *> tmp = exp.getCert();
			this->ecert = exp.getFals();
			this->efals = tmp;

            break;
		}

        case 1: { // exprSimple -> ( exprSimple )
            // el valor pot ser un enter o boolean

            // copiarem el seus valors independentment de si són constants o no
            // no importa reservar un espai nou perquè és el mateix valor
            if(exp.getTSB() == TipusSubjacentBasic::INT || exp.getTSB() == TipusSubjacentBasic::BOOLEAN){
                this->value = exp.value;
            }else{
                driver->error( error_tipus_no_compatibles_operador(exp.getTSB()) );
                this->makeNull();
            }

			// no importa crear una altra variable temporal
			this->r = exp.getBase();
			this->d = exp.getOffset();

			// en cas que siguin expressions booleanes
			this->ecert = exp.getCert();
			this->efals = exp.getFals();

            break;
		}
		
        default:
            this->makeNull();
    }

    // i pintar a l'arbre
    if(tipus == 0){
        this->fills.push_back( driver->addTreeChild(this, "not") );
        this->fills.push_back( std::to_string(exp.getNodeId()) );
    }else if(tipus == 1){
        this->fills.push_back( driver->addTreeChild(this, "(") );
        this->fills.push_back( std::to_string(exp.getNodeId()) );
        this->fills.push_back( driver->addTreeChild(this, ")") );
    }
    Simbol::toDotFile(driver);
}

/**
 * exprSimple -> exprSimple AND M exprSimple
 * exprSimple -> exprSimple OR M exprSimple
 */
void SimbolExpressio::make(Driver *driver, SimbolExpressio a, SimbolMarcador m, SimbolExpressio b, int tipus){
    if(a.isNull() || b.isNull()){
        this->makeNull();
        return;
    }

    switch (tipus) {
        case 0: // AND
        case 1: // OR
            // els tipus subjacents bàsics d'a i b han de ser boolean
            if(a.getTSB() != TipusSubjacentBasic::BOOLEAN || b.getTSB() != TipusSubjacentBasic::BOOLEAN){
                driver->error( error_tipus_esperat(TipusSubjacentBasic::BOOLEAN) );
                this->makeNull();
                return;
            }

            if(a.getMode() == b.getMode() && a.getMode() == SimbolExpressio::Mode::CONST){
                this->mode = SimbolExpressio::Mode::CONST;

                // a i b són constants, podem calcular el valor resultat
                // i el resultat serà una constant
				bool tmpValue;
                if(tipus == 0){
					tmpValue = *(bool *) a.value->get() && *(bool *) b.value->get();
                }else if(tipus == 1){
					tmpValue = *(bool *) a.value->get() || *(bool *) b.value->get();
                }

				// guardar el nou valor
				this->value = std::make_shared<ValueContainer>((const char *) &tmpValue, sizeof(bool));
            }else{
                this->mode = SimbolExpressio::Mode::RESULTAT;
            }

            this->tipus.clear();
            this->tsb = TipusSubjacentBasic::BOOLEAN;

            break;
        
        default: 
            this->makeNull();
    }

    // i pintar a l'arbre
    this->fills.push_back( std::to_string(a.getNodeId()) );
    if(tipus == 0){
        this->fills.push_back( driver->addTreeChild(this, "and") );
    }else if(tipus == 1){
        this->fills.push_back( driver->addTreeChild(this, "or") );
    }
    this->fills.push_back( std::to_string(b.getNodeId()) );
    Simbol::toDotFile(driver);

	// segur que a i b són booleans
	switch (tipus){
		case 0: // AND
			// si un operand de l'and és cert, s'ha d'avaluar el següent
			// valor, és a dir, b
			driver->code.backpatch(m.getLabel(), a.getCert());

			// les possibles etiquetes de cert de b han de tenir un valor
			this->ecert = b.getCert();

			this->efals = a.getFals();
			for(int i = 0; i < b.getFals().size(); i++){
				this->efals.push_back(b.getFals()[i]);
			}

			break;

		case 1: // OR
			// si un operand és fals, s'ha d'avaluar el següent valor,
			// és a dir, b
			driver->code.backpatch(m.getLabel(), a.getFals());

			// les etiquetes de cert han de tenir un possible valor
			this->efals = b.getFals();

			this->ecert = a.getCert();
			for(int i = 0; i < b.getCert().size(); i++){
				this->ecert.push_back(b.getCert()[i]);
			}
			
			break;

	}

}


/**
 * exprSimple -> referencia
 */
void SimbolExpressio::make(Driver *driver, SimbolReferencia ref){
    if(ref.isNull()){
        // és una referència invàlida, s'ha d'ignorar
        this->makeNull();
        return;
    }

    this->tsb = ref.getTSB();
    this->tipus = ref.getTipus();

    switch (ref.getMode()) {
        case SimbolReferencia::ModeMVP::CONST: {
            this->mode = SimbolExpressio::Mode::CONST;

            // consultar el seu valor a la taula de símbols
            DescripcioConstant *dc = (DescripcioConstant *) driver->ts.consulta(ref.getId());

			// i obtenir la mida del tipus
			DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(ref.getTipus());

			// crear un nou contenedor pel valor
			// si és un array (o un string) s'està accedint a un valor
			this->value = std::make_shared<ValueContainer>(dc->getValue()->get() + ref.getConstOffset(), dt->getOcupacio());
            break;
        }

        case SimbolReferencia::ModeMVP::VAR:
            this->mode = SimbolExpressio::Mode::VAR;
            break;

        case SimbolReferencia::ModeMVP::CRIDA_COMPLETA:
            this->mode = SimbolExpressio::Mode::RESULTAT;
            break;

        default: 
            // no hauria d'arribar aquí perquè si és una referència 
            this->makeNull();
            return;
    }

    // i pintar a l'arbre
    this->fills.push_back( std::to_string(ref.getNodeId()) );
    Simbol::toDotFile(driver);

	// copiar la variable
	this->r = ref.getBase();
	this->d = ref.getOffset();

	// en cas de tractar-se d'un boolean s'hauria de saltar al lloc corresponent
	if(ref.getTSB() == TipusSubjacentBasic::BOOLEAN){
		// obtenir el número de variable associat a true i false
		// de la TS
		DescripcioConstant *dtrue = (DescripcioConstant *) driver->ts.consulta("true");
		DescripcioConstant *dfalse = (DescripcioConstant *) driver->ts.consulta("false");

		// desreferenciar el valor (si és necessari)
		Variable *tmp = this->dereference(driver, this->tsb);
		
		Label l;

		// afegir salts condicionals
		CondJumpInstruction *trueJump = new CondJumpInstruction(
			CondJumpInstruction::Operator::EQ,
			dtrue->getVariable(),
			tmp,
			l
		);
		
		driver->code.addInstruction(trueJump);
		this->ecert.push_back(trueJump);

		Label lfalse;
		GoToInstruction *falseJump = new GoToInstruction(lfalse);
		driver->code.addInstruction(falseJump);
		this->efals.push_back(falseJump);
	}
}

/**
 * exprSimple -> exprSimple if exprSimple else exprSimple
 */
void SimbolExpressio::make(Driver *driver, SimbolExpressio a, SimbolExpressio b, SimbolExpressio c){
    if(a.isNull() || b.isNull() || c.isNull()){
        this->makeNull();
        return;
    }

    if(b.getTSB() != TipusSubjacentBasic::BOOLEAN){
        this->makeNull();
        driver->error( error_tipus_esperat(TipusSubjacentBasic::BOOLEAN) );
        return;
    }

    if(a.getTSB() != c.getTSB()){
        this->makeNull();
        driver->error( error_tipus_no_compatibles(a.getTSB(), c.getTSB()) );
        return;
    }

    // Calcular el valor si tot són constants
    if(a.getMode() == SimbolExpressio::Mode::CONST && a.getMode() == b.getMode() && b.getMode() == c.getMode()){
		bool bValue = *(bool *) b.getValue()->get();
        if(bValue){
            // assignar el valor d'a
            this->value = a.getValue();
        }else{
            // assignar el valor de b
            this->value = b.getValue();
        }

        this->mode = SimbolExpressio::Mode::CONST;
    }else{
        this->mode = SimbolExpressio::Mode::RESULTAT;
    }

    this->tsb = a.getTSB();
    this->tipus = a.getTipus();

    // i pintar a l'arbre
    this->fills.push_back( std::to_string(a.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "if") );
    this->fills.push_back( std::to_string(b.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "else") );
    this->fills.push_back( std::to_string(c.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * exprSimple -> relExpr
 */
void SimbolExpressio::make(Driver *driver, SimbolRelExpr exp){
    if(exp.isNull()){
        this->makeNull();
        return;
    }
    
    this->value = exp.value;
    this->tsb = exp.tsb;
    this->tipus = exp.tipus;
    this->mode = exp.mode;

    // i pintar a l'arbre
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    Simbol::toDotFile(driver);

    this->ecert = exp.getCert();
    this->efals = exp.getFals();
}

/**
 * exprSimple -> aritExpr
 */
void SimbolExpressio::make(Driver *driver, SimbolArithmeticExpression exp){
    if(exp.isNull()){
        this->makeNull();
        return;
    }

    this->tsb = exp.tsb;
	this->value = exp.value;
    this->tipus = exp.tipus;
    this->mode = exp.mode;

    // i pintar a l'arbre
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    Simbol::toDotFile(driver);

	// copiar les variables
	this->r = exp.getBase();
	this->d = exp.getOffset();
}

/**
 * exprSimple -> referencia++ (tipus 0)
 * exprSimple -> referencia-- (tipus 1)
 */
void SimbolExpressio::make(Driver *driver, SimbolReferencia ref, int tipus){
	if(ref.isNull()){
		this->makeNull();
		return;
	}

	// La referència ha de ser un enter
	if(ref.getTSB() != TipusSubjacentBasic::INT){
		this->makeNull();
		this->driver->error( error_tipus_no_compatibles_operador(ref.getTSB()) );
		return;
	}

	// I no pot ser una referència constant
	if(ref.getMode() == SimbolReferencia::ModeMVP::CONST){
		this->makeNull();
		this->driver->error( error_es_constant(ref.getId()) );
		return;
	}

	// el resultat serà un valor enter
	this->tsb = TipusSubjacentBasic::INT;
	this->mode = SimbolExpressio::Mode::RESULTAT;

	// i pintar a l'arbre
    this->fills.push_back( std::to_string(ref.getNodeId()) );
	switch(tipus){
		case 0: // referencia++
        	this->fills.push_back( driver->addTreeChild(this, "++") );
			break;

		case 1: // referencia--;
        	this->fills.push_back( driver->addTreeChild(this, "--") );
			break;
	}
    Simbol::toDotFile(driver);

}

std::string SimbolExpressio::getTipus(){
    return this->tipus;
}

TipusSubjacentBasic SimbolExpressio::getTSB(){
    return this->tsb;
}

SimbolExpressio::Mode SimbolExpressio::getMode(){
    return this->mode;
}

bool SimbolExpressio::isNull() {
    return this->tsb == TipusSubjacentBasic::NUL && this->tipus.empty();
}

void SimbolExpressio::makeNull() {
    this->mode = Mode::NUL;
    this->tsb = TipusSubjacentBasic::NUL;
    this->tipus.clear();
}

int SimbolExpressio::getIntValue(){
    return this->intValue;
}

bool SimbolExpressio::getBoolValue(){
    return this->boolValue;
}

char SimbolExpressio::getCharValue(){
    return this->charValue;
}

std::shared_ptr<ValueContainer> SimbolExpressio::getValue(){
	return this->value;
}

std::vector<Instruction *> SimbolExpressio::getCert() {
    return this->ecert;
}

std::vector<Instruction *> SimbolExpressio::getFals(){
    return this->efals;
}

