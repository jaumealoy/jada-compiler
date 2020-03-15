#ifndef _H_CODE_ASSIGNMENT_INSTRUCTION
#define _H_CODE_ASSIGNMENT_INSTRUCTION

#include "Instruction.h"
#include "../Variable.h"
#include "../../utils/ValueContainer.h"
#include "../../taulasimbols/TipusSubjacentBasic.h"
#include <memory>

class AssignmentInstruction : public Instruction {
private:
	Variable desti;
	std::shared_ptr<ValueContainer> value;
	TipusSubjacentBasic tsb;

public:
	AssignmentInstruction(TipusSubjacentBasic tsb, Variable desti, std::shared_ptr<ValueContainer> value);
	~AssignmentInstruction();

	std::string toString();
};

#endif