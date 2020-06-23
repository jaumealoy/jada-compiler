#ifndef _H_TSB
#define _H_TSB

#include <string>

enum TipusSubjacentBasic {
    BOOLEAN,
    CHAR,
    INT,
    ARRAY,
	POINTER,
    NUL
};

class TSB {
private:

public:
	static int sizeOf(TipusSubjacentBasic tsb);
	static std::string getNomTSB(TipusSubjacentBasic a);
};

#endif
