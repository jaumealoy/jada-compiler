#ifndef _H_CODE_ASSIGNMENT_INSTRUCTION
#define _H_CODE_ASSIGNMENT_INSTRUCTION

#include "Instruction.h"
#include "../Variable.h"
#include "../../utils/ValueContainer.h"
#include "../../taulasimbols/TipusSubjacentBasic.h"
#include <memory>

class AssignmentInstruction : public Instruction {
private:
	std::shared_ptr<ValueContainer> value;
	TipusSubjacentBasic tsb;

	Variable desti;
	Variable origen;

public:
	AssignmentInstruction(TipusSubjacentBasic tsb, Variable desti, std::shared_ptr<ValueContainer> value);
	AssignmentInstruction(Variable desti, Variable origen);
	~AssignmentInstruction();

	std::string toString();
};

#endif