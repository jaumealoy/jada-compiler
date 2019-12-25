#ifndef _H_CONTROL_INSTRUCCIONS
#define _H_CONTROL_INSTRUCCIONS

#include "../taulasimbols/TipusSubjacentBasic.h"
#include <string>

/**
 * Dades necessàries per controlar blocs d'instruccions i llistes d'instruccions
 */
class ControlInstruccions {
protected:
    // Per comprovar si té break
    bool _conteBreak;

    // Per comprovar si conté returns i el seu tipus
    bool _conteReturn;
    std::string tipusReturn;
    TSB::TipusSubjacentBasic tsbReturn;

    void propaga(ControlInstruccions obj);
    void propaga(ControlInstruccions &a, ControlInstruccions &b);

public:
    // funcions per comprovar break
    bool conteBreak();
    
    // funcions per comprovar returns
    bool conteReturn();
    std::string getTipusReturn();
    TSB::TipusSubjacentBasic getTSBReturn();
};

#endif
