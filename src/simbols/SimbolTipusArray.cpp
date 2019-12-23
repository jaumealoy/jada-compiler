#include "SimbolTipusArray.h"
#include "../Driver.h"
#include <iostream>

SimbolTipusArray::SimbolTipusArray() : Simbol(), dimensions() {}
SimbolTipusArray::~SimbolTipusArray() {}

void SimbolTipusArray::make(Driver *driver, int dimensio){
    this->dimensions.push_back(dimensio);
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
}

/**
 * Insereix un tipus array si no existeix a la taula de símbols
 * array -> contArray [ INT_LITERAL ]
 */
void SimbolTipusArray::make(Driver *driver) {
    std::cout << "Final array!" << std::endl;

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
        DescripcioTipusArray *dt = new DescripcioTipusArray(nomTipus);
        driver->ts.posar(nomTipus, dt);
    }
}

void SimbolTipusArray::toDotFile(){}

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