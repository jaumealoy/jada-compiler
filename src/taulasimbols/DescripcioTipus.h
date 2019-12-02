#ifndef _H_DECLARACIOTIPUS 
#define _H_DECLARACIOTIPUS

#include "Descripcio.h"
#include "TipusSubjacentBasic.h"

using namespace TSB;

class DescripcioTipus : public Descripcio {
private:
    TipusSubjacentBasic tsb;

    long limitInferior;
    long limitSuperior;
public:
    DescripcioTipus(TipusSubjacentBasic tsb, long min, long max);
    ~DescripcioTipus();
};

#endif