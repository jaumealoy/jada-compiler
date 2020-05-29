#ifndef _H_CODE_SKIP_INSTRUCTION
#define _H_CODE_SKIP_INSTRUCTION

#include "Instruction.h"
#include "../Label.h"

class SkipInstruction : public Instruction {
private:
	Label *label;
	
	// etiqueta de la precapçalera
	SkipInstruction *preheader;

public:
	SkipInstruction(Label *lbl);
	~SkipInstruction();

	std::string toString();
	void generateAssembly(CodeGeneration *);

	Label *getLabel();
	void setLabel(Label *);

	bool optimize(CodeGeneration *code);

	SkipInstruction *getPreHeaderInstruction();
	void setPreHeaderInstruction(SkipInstruction *instruction);
};

#endif