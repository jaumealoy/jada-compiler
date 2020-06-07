#ifndef _H_CODE_ASSIGNMENT_INSTRUCTION
#define _H_CODE_ASSIGNMENT_INSTRUCTION

#include "Instruction.h"
#include "../Variable.h"
#include "../../utils/ValueContainer.h"
#include "../../taulasimbols/TipusSubjacentBasic.h"
#include <memory>


/**
 * Existeixen diferents tipus d'assignacions
 * a = b
 * a[c] = b
 * a = b[c]
 * i és necessari contemplar els diferents casos
 */

class AssignmentInstruction : public Instruction {
public:
	enum Type{
		SIMPLE,
		SOURCE_OFF, // a = b[c]
		TARGET_OFF // a[c] = b
	};

private:
	// indicar valors constants
	std::shared_ptr<ValueContainer> value;
	TipusSubjacentBasic tsb;

	// variables per indicar les diferents variables
	Variable *desti;
	Variable *origen;
	Variable *offset;

	AssignmentInstruction::Type type;

public:
	AssignmentInstruction(TipusSubjacentBasic tsb, Variable *desti, std::shared_ptr<ValueContainer> value);
	AssignmentInstruction(Variable *desti, Variable *origen);
	AssignmentInstruction(AssignmentInstruction::Type, Variable *a, Variable *b, Variable *c);
	~AssignmentInstruction();

	std::string toString();
	void generateAssembly(CodeGeneration *code);

	// optimització
	bool optimize(CodeGeneration * code);

	// actualitza la informació sobre valors constants
	void updateConstants();

	// informació sobre la pròpia instrucció
	AssignmentInstruction::Type getType();
	Variable *getDesti();
	Variable *getOffset();

	Variable *getOrigen();
	void setOrigen(Variable *origen);
};

#endif