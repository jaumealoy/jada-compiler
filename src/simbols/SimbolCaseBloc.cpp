#include "SimbolCaseBloc.h"
#include "../Driver.h"

/**
 * caseBloc -> CASE literal DO bloc BEND casebloc
 */

void SimbolCaseBloc::make(Driver *driver, SimbolLiteral lit, SimbolBloc bloc, SimbolCaseBloc casebloc) {
    //Se debería propagar por cada case el tipo del ls y ir comprobando.
    if (lit.getTSB() == NUL || casebloc.getLiteral().getTSB() == NUL) {
        //Ignorar
        this->sl.setTSB(NUL);
        return;
    }

    if ((lit.getTSB() != INT) && (lit.getTSB() != CHAR) && (lit.getTSB() != BOOLEAN)) {     
        driver->error("Tipus del literal del case no comparable");
    }
    /* NO CREO QUE HAGA FALTA, YA SE HABRÁ COMPROBADO EN LA ANTERIOR REDUCCIÓN
    if ((casebloc.getLiteral().getTSB() != INT) && (casebloc.getLiteral().getTSB() != CHAR) && (casebloc.getLiteral().getTSB() != BOOLEAN)) {     
        driver->error("Expressió no comparable.");
    }  
    */  


    if (lit.getTSB() != casebloc.getLiteral().getTSB()) {
        driver->error("cases del switch de diferent tipus subjacent.");
    }

    if (!(lit.getTipus().empty() || casebloc.getLiteral().getTipus().empty())) {
        if (lit.getTipus() != casebloc.getLiteral().getTipus()) {
            driver-> error("Cases del switch de diferent tipus.");
        }
    }

    driver->error("ANALIZANDO CASEBLOC");

    /* ASÍ O CON PUNTEROS? */ 
    this->sl.setTipus(lit.getTipus());
    this->sl.setTSB(lit.getTSB());
}

/**
 * CaseBloc -> DEFAULT DO bloc BEND
 */
void SimbolCaseBloc::make(Driver *driver, SimbolBloc bloc) {
    //Propagar breaks y returns al bloque actual
    this->propaga(bloc);
}

SimbolLiteral SimbolCaseBloc::getLiteral() {
    return this->sl;
}