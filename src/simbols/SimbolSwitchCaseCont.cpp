#include "SimbolSwitchCaseCont.h"
#include "SimbolContSwitch.h"
#include "../Driver.h"
#include "../code/instructions/SkipInstruction.h"
#include "../code/instructions/CondJumpInstruction.h"

SimbolSwitchCaseCont::SimbolSwitchCaseCont() : Simbol("SwitchCaseCont") {}
SimbolSwitchCaseCont::~SimbolSwitchCaseCont() {}

/**
 * switchCaseCont -> contSwitch M0 exprSimple
 */
void SimbolSwitchCaseCont::make(Driver *driver, SimbolContSwitch cont, SimbolExpressio exp, SimbolMarcador m1){
	// si ja existeix un default no es pot permetre posar un nou case
	// perquè el default no seria el darrer cas a avaluar
	if(cont.hasDefault()){
		driver->error( error_default_darrer(), true );
		this->tsb = cont.getTSB();
		this->tipus = cont.getTipus();
		return;
	}

	// si l'expressió no és vàlida, ignorar
	if(exp.isNull()){
		return;
	}

	// comprovar que el tipus de exp és compatible amb el de cont
	if (exp.getTSB() == ARRAY) {
		driver->error(error_tipus_no_comparable(exp.getTipus()), true);
		return;
	}

	if (exp.getTSB() != cont.getTSB()) {
		driver->error(error_tipus_no_compatibles(exp.getTSB(), cont.getTSB()), true);
		return;
    }

	// si exp és constant, comprovar que no hi ha un cas repetit
	this->valors = cont.getValors();
	if(exp.getMode() == SimbolExpressio::Mode::CONST){
		// cercar dins la llista d'expressions
		bool trobat = false;
		std::list<std::shared_ptr<ValueContainer>>::iterator it = this->valors.begin();
		while(!trobat && it != this->valors.end()){
			std::shared_ptr<ValueContainer> value = *it;
			trobat = (*value) == (*exp.getValue());
			it++;
		}

		if(trobat){
			// és un error, ja està definit aquest case
			std::string caseValue;
			switch(exp.getTSB()){
				case TipusSubjacentBasic::BOOLEAN:
					if(*(bool *) exp.getValue().get()){
						caseValue = "true";
					}else{
						caseValue = "false";
					}
					break;
				
				case TipusSubjacentBasic::INT:
					caseValue = std::to_string(*(int *) exp.getValue()->get());
					break;

				case TipusSubjacentBasic::CHAR:
					caseValue = std::to_string(*(char *) exp.getValue().get());
					break;
			}

			driver->error( error_case_definit(caseValue), true );
		}else{
			// afegir el nou valor a la llista
			this->valors.push_back(exp.getValue());
		}
	}

	// propagar els valors
	this->tsb = cont.getTSB();
	this->tipus = cont.getTipus();
	this->r = cont.getVariable();
	this->fi = cont.getFi();
	this->teDefault = cont.hasDefault();

	// és possible que el case anterior tengui un salt incondicional 
	// a un etiqueta no definida
	if(cont.getPreviousCondJump() != nullptr){
		driver->code.backpatch(m1.getLabel(), cont.getPreviousCondJump());
	}

	if(this->tsb == TipusSubjacentBasic::BOOLEAN){
		// TODO: gestionar avaluació condicionada	
	}else{
		// generar salt condicional
		CondJumpInstruction *inst = new CondJumpInstruction(
			CondJumpInstruction::Operator::NEQ,
			exp.dereference(driver),
			this->r,
			Label() // la definirem posteriorment
		);
		
		driver->code.addInstruction(inst);
		this->previousCondJump = inst;
	}

	// aquí comença el codi del bloc (indicar l'etiqueta d'inici)
	Label lstart = driver->code.addLabel();
	driver->code.addInstruction(new SkipInstruction(lstart));

	// canviar les etiquetes anteriors
	if(cont.getPreviousGoTo() != nullptr){
		driver->code.backpatch(lstart, cont.getPreviousGoTo());
	}
}

Instruction * SimbolSwitchCaseCont::getPreviousGoTo(){ return this->previousGoTo; }
Instruction *SimbolSwitchCaseCont::getPreviousCondJump(){ return this->previousCondJump; }
Label SimbolSwitchCaseCont::getFi(){ return this->fi; }

Variable SimbolSwitchCaseCont::getVariable(){ return this->r; }
TipusSubjacentBasic SimbolSwitchCaseCont::getTSB(){ return this->tsb; }
std::string SimbolSwitchCaseCont::getTipus(){ return this->tipus; }
bool SimbolSwitchCaseCont::hasDefault(){ return this->teDefault; }
	
std::list<std::shared_ptr<ValueContainer>> SimbolSwitchCaseCont::getValors(){ return this->valors; }