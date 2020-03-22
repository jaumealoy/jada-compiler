#include "AssignmentInstruction.h"

AssignmentInstruction::AssignmentInstruction(TipusSubjacentBasic tsb, Variable desti, std::shared_ptr<ValueContainer> value)
	: Instruction(Instruction::Type::ASSIGNMENT), origen(true)
{
	this->desti = desti;
	this->tsb = tsb;
	this->value = value;
	this->offset.makeNull();
	this->type = AssignmentInstruction::Type::SIMPLE;
}

AssignmentInstruction::AssignmentInstruction(Variable desti, Variable origen)
	: Instruction(Instruction::Type::ASSIGNMENT)
{
	this->origen = origen;
	this->desti = desti;
	this->offset.makeNull();
	this->type = AssignmentInstruction::Type::SIMPLE;
}

AssignmentInstruction::AssignmentInstruction(AssignmentInstruction::Type type, Variable a, Variable b, Variable c) 
	: Instruction(Instruction::Type::ASSIGNMENT)
{
	this->desti = a;
	this->origen = b;
	this->offset = c;
	this->type = type;
}

AssignmentInstruction::~AssignmentInstruction(){}

std::string AssignmentInstruction::toString(){
	std::string tmp;

	switch (type){
		case AssignmentInstruction::Type::TARGET_OFF:
			tmp += this->desti.getNom() + "["+ this->offset.getNom() +"] = ";
			break;

		default:
			tmp = this->desti.getNom() + " = ";
	}

	if(origen.isNull()){
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
		tmp += this->origen.getNom();
	}

	return tmp;
}