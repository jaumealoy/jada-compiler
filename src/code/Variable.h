#ifndef _H_CODE_VARIABLE
#define _H_CODE_VARIABLE

#include <string>

class Variable {
private:
	std::string name;

	// interessa poder tenir "variables" nul·les, cosa que pot ser
	// servir al desplaçament per indicar que no n'hi ha
	bool null;

public:
	Variable();
	Variable(bool null);
	Variable(std::string name);
	~Variable();

	bool isNull();
	void makeNull();

	std::string getNom();
};

#endif