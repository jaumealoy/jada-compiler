#ifndef _H_CODE_VARIABLE
#define _H_CODE_VARIABLE

#include <string>

class Variable {
private:
	int id;
	std::string name;

	// interessa poder tenir "variables" nul·les, cosa que pot ser
	// servir al desplaçament per indicar que no n'hi ha
	bool null;

public:
	Variable();
	Variable(int id);
	Variable(bool null);
	Variable(bool null, int id);
	Variable(int id, std::string name);
	~Variable();

	bool isNull();
	void makeNull();

	std::string getNom();
};

#endif