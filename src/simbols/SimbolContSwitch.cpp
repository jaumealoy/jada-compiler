#include "SimbolContSwitch.h"
#include "../Driver.h"

SimbolContSwitch::SimbolContSwitch() : SimbolStatement() {}

SimbolContSwitch::~SimbolContSwitch(){}

/*  void SimbolSwitchStatement::make(Driver *driver, SimbolExpressio exp, SimbolCaseBloc bloc) {
    // És un bucle, pot contenir break al seu interior i no es propaga a l'exterior
    // però és possible que tengui un return, que sí s'hauria de propagar
    this->propaga(bloc);


    // Comprovar que l'expressió del switch és un boolean
    if(exp.getTSB() == TipusSubjacentBasic::ARRAY || exp.getTSB() == TipusSubjacentBasic::NUL){
        driver->error("tipus d'expressió de switch no avaluable");
    }

    //Controlar que el return data o parecido (literal del caseBloc) coincida.

    //El tipo subyacente no puede ser array o nul.
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
} */


/**
 * ContSwitch -> exprSimple RIGHTPARAN BBEGIN DEFAULT BBEGIN bloc BEND
 */
void SimbolContSwitch::make(Driver *driver, SimbolExpressio exp, SimbolBloc bloc) {
    //Propagar el return i els breaks
    this->propaga(bloc);

    this->teDefault = true;

    //Asignació del resultat de l'expressió
    this->tsb = exp.getTSB();
    this->tipus = exp.getTipus();
}

/**
 *  ContSwitch -> exprSimple RIGHTPARAN BBEGIN CASE exprSimple BBEGIN bloc BEND
 */
void SimbolContSwitch::make(Driver *driver, SimbolExpressio exp1, SimbolExpressio exp2, SimbolBloc bloc) {
    //Propagar returns i breaks
    this->propaga(bloc);

    this->teDefault = false;

    if (exp1.isNull() || exp2.isNull()) {
        return;
    }

    if (exp1.getTSB() == ARRAY) {
        driver->error("Expressió de tipus array no vàlida.");
        return;
    }

    if (exp2.getTSB() != exp1.getTSB()) {
        driver->error("No coincideixen els tipus de les expressions.");
        return;
    }

    if (exp2.getMode () != SimbolExpressio::CONST) {
        driver->error("Literal del case no es constant.");
        return;
    }

    switch (exp2.getTSB()) {
        case INT: 
            this->valors.push_back(exp2.getIntValue());
            break;
        case CHAR: 
            this->valors.push_back((int) exp2.getCharValue());
            break;
        case BOOLEAN: 
            this->valors.push_back((int) exp2.getBoolValue());
            break;
    }

    this->tsb = exp1.getTSB();
    this->tipus = exp1.getTipus();
}

/**
 * ContSwitch -> contSwitch DEFAULT BBEGIN bloc BEND
 */
void SimbolContSwitch::make(Driver *driver, SimbolContSwitch cont, SimbolBloc bloc) {
    //Propagar el return i els breaks
    this->propaga(bloc);

    if (cont.teDefault) {
        driver->error("Massa defaults al switch.");
        return;
    }
    this->teDefault = true;

    //Asignació del resultat de l'expressió
    this->tsb = cont.tsb;
    this->tipus = cont.tipus;
    this->valors = cont.valors;
}

/**
 * contSwitch -> contSwitch CASE exprSimple BBEGIN bloc BEND
 */
void SimbolContSwitch::make(Driver *driver, SimbolContSwitch cont, SimbolExpressio exp, SimbolBloc bloc) {
    this->propaga(bloc);

    int valor;

    if (exp.isNull()) {
        return;
    }

    if (exp.getTSB() != cont.tsb) {
        driver->error("No coincideixen els tipus de les expressions.");
        return;
    }

    if (exp.getMode () != SimbolExpressio::CONST) {
        driver->error("Literal del case no es constant.");
        return;
    }    

    switch (exp.getTSB()) {
        case INT:
            valor = exp.getIntValue();
            break;
        case CHAR: 
            valor = (int) exp.getCharValue();
            break;
        case BOOLEAN: 
            valor = (int) exp.getBoolValue();
            break;
    } 

    this->valors = cont.valors;
    for (int i = 0; i < valors.size(); i++) {
        if (valor == valors[i]) {
            driver->error("Coincidencia de valors dels cases del switch");
            return;
        }
    }
    valors.push_back(valor);

    this->teDefault = cont.teDefault;
    this->tsb = cont.tsb;
    this->tipus = cont.tipus;
}