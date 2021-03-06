#ifndef _H_CODE_GOTO_INSTRUCTION
#define _H_CODE_GOTO_INSTRUCTION

#include "Instruction.h"
#include "../Label.h"

class GoToInstruction : public Instruction {
private:
	Label *label;

public:
	GoToInstruction(Label *label);
	~GoToInstruction();

	void setLabel(Label *l);
	Label *getTarget();

	std::string toString();
	void generateAssembly(CodeGeneration *);

	// optimitzacions
	bool optimize(CodeGeneration *);
};

#endif