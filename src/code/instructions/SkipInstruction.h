#ifndef _H_CODE_SKIP_INSTRUCTION
#define _H_CODE_SKIP_INSTRUCTION

#include "Instruction.h"
#include "../Label.h"

class SkipInstruction : public Instruction {
private:
	Label *label;
	
	// etiqueta de la precapçalera
	SkipInstruction *preheader;

	// inici de bloc de bucle
	bool loopStart;

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

	bool isLoopStart();
	void setLoopStart(bool loopStart);
};

#endif