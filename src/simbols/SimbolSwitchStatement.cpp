#include "SimbolSwitchStatement.h"
#include "../Driver.h"

SimbolSwitchStatement::SimbolSwitchStatement() : SimbolStatement() {}

SimbolSwitchStatement::~SimbolSwitchStatement(){}

void SimbolSwitchStatement::make(Driver *driver, SimbolExpressio exp, SimbolCaseBloc bloc) {
    // És un bucle, pot contenir break al seu interior i no es propaga a l'exterior
    // però és possible que tengui un return, que sí s'hauria de propagar
    this->propaga(bloc);


    // Comprovar que l'expressió del switch és un boolean
    if(exp.getTSB() == TipusSubjacentBasic::ARRAY || exp.getTSB() == TipusSubjacentBasic::NUL){
        driver->error("tipus d'expressió de switch no avaluable");
    }

    //Controlar que el return data o parecido (literal del caseBloc) coincida.

    //El tipo subyacente no puede ser array o nul.

    /* PODRÍA SER NUL? */
    if ((bloc.getLiteral().getTSB() != INT) && (bloc.getLiteral().getTSB() != CHAR) && (bloc.getLiteral().getTSB() != BOOLEAN)) {     
        driver->error("Valor de case no comparable.");
    }

    
    if ((exp.getTSB() != INT) && (exp.getTSB() != CHAR) && (exp.getTSB() != BOOLEAN)) {     
        driver->error("Valor resultant de l'expressió del switch no comparable.");
    }    

    if (bloc.getLiteral().getTSB() != exp.getTSB()) {
        driver->error("Tipus de case erroni.");
    }

    if (!(bloc.getLiteral().getTipus().empty() || exp.getTipus().empty())) {
        if (bloc.getLiteral().getTipus() != exp.getTipus()) {
            driver-> error("Expressió de switch i valor de case de diferent tipus.");
        }
    }

    driver->error("ANALIZANDO SWITCH STATEMENT");
}