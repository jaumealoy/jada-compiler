#include "TipusSubjacentBasic.h"

using namespace TSB;

TipusSubjacentBasic TSB::BOOLEAN(1);
TipusSubjacentBasic TSB::CHAR(1);
TipusSubjacentBasic TSB::INT(4);
TipusSubjacentBasic TSB::ARRAY(0);
TipusSubjacentBasic TSB::NUL(0);


TipusSubjacentBasic::TipusSubjacentBasic() : TipusSubjacentBasic(0) {}

TipusSubjacentBasic::TipusSubjacentBasic(int ocupacio){
    this->ocupacio;
}

TipusSubjacentBasic::~TipusSubjacentBasic(){
    
}