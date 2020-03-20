#ifndef _H_CODE_LABEL
#define _H_CODE_LABEL
#include <string>

class Label{
private:
	static int counter;
	int labelId;
	std::string name;

public:
	Label();
	~Label();

	int getId();
	std::string toString();
};

#endif