#ifndef _H_CONTROL_INSTRUCCIONS
#define _H_CONTROL_INSTRUCCIONS

#include "../taulasimbols/TipusSubjacentBasic.h"
#include "../code/instructions/Instruction.h"
#include "../location.hh"
#include <string>
#include <vector>
#include <list>

/**
 * Dades necessàries per controlar blocs d'instruccions i llistes d'instruccions
 */
class ControlInstruccions {
public:
    struct ReturnData {
        std::string tipus;
        TipusSubjacentBasic tsb;

        // incloure altre informació sobre el return
        yy::location loc;

		Instruction *returnInst;
    };

protected:
    // Per comprovar si té break
    bool _conteBreak;
	std::list<Instruction *> _breakList;

    // Per comprovar si conté returns i el seu tipus
    std::vector<struct ReturnData> _returns;

    void propaga(ControlInstruccions obj);
    void propaga(ControlInstruccions &a, ControlInstruccions &b);

	// Per guardar les possibles llistes d'instruccions de backpatching
	std::list<Instruction *> seg;

public:
    // funcions per comprovar break
    bool conteBreak();
	std::list<Instruction *> getBreaks();

    // funcions per comprovar returns
    std::vector<struct ReturnData> getReturns();
    bool conteReturn();

	// obtenció de la llista de següents
	std::list<Instruction *> getSeg();
};

#endif
