#ifndef _H_CODE_REFERENCE
#define _H_CODE_REFERENCE

#include "Variable.h"
class Driver;

class Reference {
protected:
	Variable *r; // base
	Variable *d; // offset

public:
	Reference(Variable *r, Variable *d);
	Reference();
	~Reference();

	Variable *dereference(Driver *driver, TipusSubjacentBasic tsb);

	Variable *getBase();
	Variable *getOffset();
};

#endif