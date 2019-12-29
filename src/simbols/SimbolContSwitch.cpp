#include "SimbolContSwitch.h"
#include "../Driver.h"

SimbolContSwitch::SimbolContSwitch() : SimbolStatement() {
    this->nomNode = "ContSwitch";
}

SimbolContSwitch::~SimbolContSwitch(){}

/**
 * ContSwitch -> exprSimple ) begin default begin bloc end
 */
void SimbolContSwitch::make(Driver *driver, SimbolExpressio exp, SimbolBloc bloc) {
    //Propagar el return i els breaks
    this->propaga(bloc);

    this->teDefault = true;

    //Asignació del resultat de l'expressió
    this->tsb = exp.getTSB();
    this->tipus = exp.getTipus();

    // pintar a l'arbre
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ") begin default begin") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end ") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 *  ContSwitch -> exprSimple ( begin case exprSimple begin bloc end
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

    // pintar a l'arbre
    this->fills.push_back( std::to_string(exp1.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "( begin case ") );
    this->fills.push_back( std::to_string(exp2.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "begin ") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end ") );
    Simbol::toDotFile(driver);
}

/**
 * ContSwitch -> contSwitch default begin bloc end
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

    // pintar a l'arbre
    this->fills.push_back( std::to_string(cont.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "default begin") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end ") );
    Simbol::toDotFile(driver);
}

/**
 * contSwitch -> contSwitch case exprSimple begin bloc end
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

    // pintar a l'arbre
    this->fills.push_back( std::to_string(cont.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "case") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "begin") );
    this->fills.push_back( std::to_string(bloc.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "end ") );
    Simbol::toDotFile(driver);
}