#ifndef _H_CODE_LABEL
#define _H_CODE_LABEL

#include <string>

class SkipInstruction;
class BasicBlock;

class Label{
private:
	static int counter;
	int labelId;
	std::string name;

	// instrucció que indica on és l'etiqueta
	SkipInstruction *target;

	// indica si existeix alguna instrucció de salt que en faci ús
	bool used;

	// quin bloc bàsic indica
	BasicBlock *block;

public:
	Label();
	Label(int id);
	Label(int id, std::string name);

	~Label();

	int getId();
	std::string toString();

	void setTargetInstruction(SkipInstruction *inst);
	SkipInstruction *getTargetInstruction();

	void setBlock(BasicBlock *block);
	BasicBlock *getBlock();

	// per determinar si una etiqueta s'utilitza
	bool isUsed();
	void resetUsage();
	void markUsage();
};

#endif