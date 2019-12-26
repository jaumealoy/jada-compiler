#ifndef _H_TSB
#define _H_TSB 1

/*namespace TSB {

class TipusSubjacentBasic {
private:
    int ocupacio;
    
public:
    TipusSubjacentBasic();
    TipusSubjacentBasic(int ocupacio);
    ~TipusSubjacentBasic();

    bool operator !=(TipusSubjacentBasic const &obj);
    bool operator ==(TipusSubjacentBasic const &obj);
};

extern TipusSubjacentBasic BOOLEAN;
extern TipusSubjacentBasic CHAR;
extern TipusSubjacentBasic INT;
extern TipusSubjacentBasic ARRAY;
extern TipusSubjacentBasic NUL;

};*/

enum TipusSubjacentBasic {
    BOOLEAN,
    CHAR,
    INT,
    ARRAY,
    NUL
};


#endif
