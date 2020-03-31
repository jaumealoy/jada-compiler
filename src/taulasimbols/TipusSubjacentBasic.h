#ifndef _H_TSB
#define _H_TSB

enum TipusSubjacentBasic {
    BOOLEAN,
    CHAR,
    INT,
    ARRAY,
    NUL
};

class TSB {
private:

public:
	static int sizeOf(TipusSubjacentBasic tsb);
};

#endif
