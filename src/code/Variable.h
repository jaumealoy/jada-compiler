#ifndef _H_CODE_VARIABLE
#define _H_CODE_VARIABLE

#include <string>

class Variable {
private:
	std::string name;
public:
	Variable();
	Variable(std::string name);
	~Variable();

	std::string getNom();
};

#endif