#ifndef _H_TSB
#define _H_TSB 1

namespace TSB {

class TipusSubjacentBasic {
private:
    int ocupacio;
    
public:
    TipusSubjacentBasic();
    TipusSubjacentBasic(int ocupacio);
    ~TipusSubjacentBasic();
};

extern TipusSubjacentBasic BOOLEAN;
extern TipusSubjacentBasic CHAR;
extern TipusSubjacentBasic INT;

};


#endif
