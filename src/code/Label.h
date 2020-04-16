#ifndef _H_CODE_LABEL
#define _H_CODE_LABEL

#include <string>
class SkipInstruction;

class Label{
private:
	static int counter;
	int labelId;
	std::string name;

	// instrucció que indica on és l'etiqueta
	SkipInstruction *target;
public:
	Label();
	Label(int id);
	Label(int id, std::string name);

	~Label();

	int getId();
	std::string toString();

	void setTargetInstruction(SkipInstruction *inst);
	SkipInstruction *getTargetInstruction();
};

#endif