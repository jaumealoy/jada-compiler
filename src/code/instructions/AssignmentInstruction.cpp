#include "AssignmentInstruction.h"
#include "../CodeGeneration.h"
#include <exception>
#include <iostream>

AssignmentInstruction::AssignmentInstruction(TipusSubjacentBasic tsb, Variable *desti, std::shared_ptr<ValueContainer> value)
	: Instruction(Instruction::Type::ASSIGNMENT)
{
	// tipus i valor de la constant
	this->tsb = tsb;
	this->value = value;
	
	// assignació de l'estil: desti = constant
	this->type = AssignmentInstruction::Type::SIMPLE;

	// variables
	this->desti = desti;
	this->offset = nullptr;
	this->origen = nullptr;
}

AssignmentInstruction::AssignmentInstruction(Variable *desti, Variable *origen)
	: Instruction(Instruction::Type::ASSIGNMENT)
{
	// assignació de l'estil: desti = origen
	this->type = AssignmentInstruction::Type::SIMPLE;

	this->origen = origen;
	this->desti = desti;
	this->offset = nullptr;
}

AssignmentInstruction::AssignmentInstruction(AssignmentInstruction::Type type, Variable *a, Variable *b, Variable *c) 
	: Instruction(Instruction::Type::ASSIGNMENT)
{
	// assignació personalitzada
	if(this->type != AssignmentInstruction::SIMPLE && c == nullptr) {
		// error, no és pot utilitzar sense un offset vàlid
		throw new std::invalid_argument("AssignmentInstrucion: c és nullptr");
	}

	this->type = type;
	this->desti = a;
	this->origen = b;
	this->offset = c;
}

AssignmentInstruction::~AssignmentInstruction(){}

/**
 * Generació de codi intermedi
 */
std::string AssignmentInstruction::toString(){
	std::string tmp;

	switch (type){
		case AssignmentInstruction::Type::TARGET_OFF:
			tmp += this->desti->getNom() + "["+ this->offset->getNom() +"] = ";
			break;

		default:
			tmp = this->desti->getNom() + " = ";
	}

	if(origen == nullptr){ // és una constant
		switch(this->tsb){
			case TipusSubjacentBasic::BOOLEAN: {
				bool boolValue = *(bool *) this->value->get();
				
				if(boolValue){
					tmp += "true";
				}else{
					tmp += "false";
				}

				break;
			}

			case TipusSubjacentBasic::CHAR: {
				char charValue = *this->value->get();
				tmp += charValue;
				break;

			}

			case TipusSubjacentBasic::INT: {
				int intValue = *(int *) this->value->get();
				tmp += std::to_string(intValue);
				break;
			}

			default: 
				tmp += "valor no vàlid";
		}
	}else{
		switch (this->type) {
			case AssignmentInstruction::Type::SOURCE_OFF:
				tmp += this->origen->getNom() + "[" + this->offset->getNom() + "]";
				break;

			default:
				tmp += this->origen->getNom();
		}
		
	}

	return tmp;
}

void AssignmentInstruction::generateAssembly(CodeGeneration *code){
	std::string tmp;

	switch (this->type) {
		case AssignmentInstruction::Type::SIMPLE:
			if (origen == nullptr) {
				// es tracta d'un valor constant variable = constant
				int mida = this->desti->getOcupacio();
				int valorConstant = 0;

				switch (mida) {
					case 1:
						valorConstant = (int) *this->value->get();
						break;

					case 4:
						valorConstant = *(int *) this->value->get();
						break;

					case 8:
						valorConstant = *(long *) this->value->get();
						break;
				}

				code->output << "mov";
				code->output << CodeGeneration::getSizeTag(true, mida);
				code->output << "\t$" + std::to_string(valorConstant) + ",";
				code->output << " " + this->getAssemblyVariable(this->desti);
			} else {
				// és una assignació entre variables
				// mov origen, registre A
				code->load(this, this->origen, CodeGeneration::Register::A);

				// mov registre A, desti
				code->store(this, CodeGeneration::Register::A, desti);
			}

			break;

		default:
			tmp = "";
	}

};