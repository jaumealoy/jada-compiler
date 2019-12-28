#include "SimbolArrayInit.h"
#include "../Driver.h"

#include <iostream>

SimbolArrayInit::SimbolArrayInit() : SimbolExpressio() {}
SimbolArrayInit::~SimbolArrayInit() {}

/**
 * En aquest punt es pot comprovar si id és un identificador de tipus
 * vàlid i comprovar que tots els elements són compatibles
 */

/**
 * arrayInit -> id { arrayElementList }
 */
void SimbolArrayInit::make(Driver *driver, std::string tipusBasic, SimbolArrayElementList list){
    // Comprovar que id és un tipus vàlid
    Descripcio *d = nullptr;
    try {
        d = driver->ts.consulta(tipusBasic);
    } catch (TaulaSimbols::NomNoExistent ex) {
        driver->error("Tipus invàlid");
    }

    if(d->getTipus() != Descripcio::Tipus::TIPUS){
        driver->error("no és un tipus", true);
        return;
    }

    DescripcioTipus *dt = (DescripcioTipus *) d;

    // Comprovar que no és un array perquè no es permet la creació
    // d'arrays
    if(dt->getTSB() == TipusSubjacentBasic::ARRAY){
        driver->error("no es permet crear un array de " + tipusBasic, true);
        return;
    }

    // Comprovar que tots els elements són compatibles amb aquest tipus
    // i si tots són constants, l'array també ho podrà ser
    SimbolExpressio::Mode modeResultat = SimbolExpressio::Mode::CONST;
    bool valid = true && !list.isEmpty();

    std::vector<SimbolExpressio> elements = list.getElements();
    for(int i = elements.size() - 1; i >= 0 && valid; i--){
        if(elements[i].getTipus() != tipusBasic && elements[i].getTSB() != dt->getTSB()){
            valid = false;
            driver->error("element no compatible amb " + tipusBasic, false);
        }

        if(modeResultat == SimbolExpressio::Mode::CONST && modeResultat != elements[i].getMode()){
            // l'element actual no és una constant
            modeResultat = SimbolExpressio::Mode::VAR;
        }
    }

    // Generar el nom del tipus de l'array
    std::string nomTipus = "_" + tipusBasic;
    for(int i = list.getDimensions().size() - 1; i >= 0; i--){
        nomTipus += "_" + std::to_string(list.getDimensions()[i]);
    }

    // Indicar el resultat de la inicialització
    this->tsb = TipusSubjacentBasic::ARRAY;
    this->tipus = nomTipus;
    this->mode = modeResultat;
    this->match = list.coincideixen();
}

bool SimbolArrayInit::coincideixen(){
    return this->match;
}