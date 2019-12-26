#include "SimbolTipusArray.h"
#include "../Driver.h"
#include <iostream>

SimbolTipusArray::SimbolTipusArray() : Simbol("ContArray"), dimensions() {}
SimbolTipusArray::~SimbolTipusArray() {}

/**
 * Insereix una dimensió a l'array actual
 */
void SimbolTipusArray::make(Driver *driver, SimbolTipusArray contArray, int dimensio){
    if(dimensio < 0) {
        driver->error("la dimensió d'un array ha de ser positiva");
    }

    this->tipusBasic = contArray.tipusBasic;
    this->dimensions = contArray.dimensions;
    this->dimensions.push_back(dimensio);

    // afegir fills
    this->fills.push_back(std::to_string(contArray.getNodeId()));
    driver->writeToTree("\"" + std::to_string(this->nodeId) +  "_dim\"[shape=plaintext, label=\"" + std::to_string(dimensio) + "\"]");
    this->fills.push_back("\""+std::to_string(this->nodeId) +  "_dim\"");
    Simbol::toDotFile(driver);
}

/**
 * Estableix el tipus dels elements de l'array.
 * contArray -> id
 */
void SimbolTipusArray::make(Driver *driver, std::string tipusBasic) {
    // Comprovar que tipusBasic està definit a la taula de símbols
    try {
        Descripcio *d = driver->ts.consulta(tipusBasic);

        // comprovar que realment és un tipus
        if (d->getTipus() != Descripcio::Tipus::TIPUS){
            driver->error("tipusBasic no és un tipus");
        }
    } catch (TaulaSimbols::NomNoExistent ex) {
        driver->error("tipusBasic no descriu un tipus");
    }

    this->tipusBasic = tipusBasic;

    this->nomNode.swap(tipusBasic);
    Simbol::toDotFile(driver);
}

/**
 * Insereix un tipus array si no existeix a la taula de símbols
 * array -> contArray [ INT_LITERAL ]
 */
void SimbolTipusArray::make(Driver *driver) {
    // inserir l'array a la taula de símbols
    std::string nomTipus = this->toString();

    // és possible que aquest array ja estigui definit
    // en aquest cas, no s'hauria d'inserir
    try {
        Descripcio *dexistent = driver->ts.consulta(nomTipus);

        // el nomTipus comença amb un caràcter especial, per tant,
        // si existeix, segur que serà una descripció de tipus
    } catch(TaulaSimbols::NomNoExistent ex) {
        // el nom no existeix, s'ha d'inserir el tipus
        DescripcioTipusArray *dt = new DescripcioTipusArray(this->tipusBasic);
        driver->ts.posar(nomTipus, dt);

        // obtenir la mida del tipus unitari
        // sabem que existeix perquè si no ja no s'hauria arribat fins aquest punt
        DescripcioTipus *dte = (DescripcioTipus *) driver->ts.consulta(this->tipusBasic);

        int ocupacio = dte->getOcupacio();

        // i crear les dimensions, inserint-les en ordre invers
        for(int i = this->dimensions.size() - 1; i >= 0; i--){
            ocupacio *= this->dimensions[i];
            driver->ts.posarDimensio(nomTipus, new DescripcioDimensio(this->dimensions[i]));
        }

        // actualitzar l'entrada de la taula de símbols
        dt->setOcupacio(ocupacio);
    }
}

/**
 * Obté el nom que representa un array.
 * Per exemple, int[50][75] és _int_50_75
 **/
std::string SimbolTipusArray::toString(){
    std::string tmp = "_" + this->tipusBasic + "_";

    int mida = (int) dimensions.size();
    for(int i = 0; i < mida - 1; i++){
        tmp += std::to_string(dimensions[i]) + "_";
    }

    tmp += std::to_string(dimensions[mida - 1]);

    return tmp;
}