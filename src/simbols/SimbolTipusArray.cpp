#include "SimbolTipusArray.h"
#include "../Driver.h"
#include "SimbolExpressio.h"
#include <iostream>

SimbolTipusArray::SimbolTipusArray() : SimbolReferencia(), dimensions() {}
SimbolTipusArray::~SimbolTipusArray() {}

/**
 * Per la naturalesa de JADA (i de la seva gramàtica) les produccions
 * associades als arrays (la vinculada amb el Tipus i la referència)
 * - a efectes de símbols terminals - són indistingibles.
 * Per aquest motiu és necessari realitzar comprovacions estristes
 * en el semàntic.
 * 
 * Si el primer identificador que es troba (contArray -> ID) és
 * un tipus bàsic (int, string, char) es considerarà que s'està
 * fent una declaració de tipus. En canvi, si és una variable o 
 * constant se considerarà que s'està fent una referència.
 */

void SimbolTipusArray::make(Driver *driver, std::string id, SimbolExpressio exp){
    if(exp.isNull()){
        // expressió malformada
        this->makeNull();
        return;
    }

    // Comprovar si s'està fent una referència o definició d'array
    Descripcio *d = nullptr;
    try {
        d = driver->ts.consulta(id);
    } catch (TaulaSimbols::NomNoExistent ex) {
        // no és res, el nom no existeix
        driver->error("nom no reconegut", true);
        return;
    }

    // d != nullptr
    if(d->getTipus() == Descripcio::Tipus::TIPUS){
        // es vol definir un array
        this->esReferencia = false;
        this->tipusBasic = id;

        // és necessari que l'expressió estigui formada únicament per valors constants
        // i que es puguin calcular en temps de compilació
        if(exp.getMode() == SimbolExpressio::Mode::CONST && exp.getTSB() == TipusSubjacentBasic::INT){
            // existeix un valor numèric, comprovar que és positiu
            int dimensio = exp.getIntValue();

            if(dimensio < 0){
                driver->error("els array han de tenir dimensions positives");
                return;
            }else{
                // és un valor vàlid, es pot afegir aquesta dimensió a la llista de 
                // dimensions
                this->dimensions.push_back(dimensio);
            }
        }else{
            driver->error("s'espera constant entera", true);
            return;
        }
    }else if(d->getTipus() == Descripcio::Tipus::VARIABLE || d->getTipus() == Descripcio::Tipus::CONSTANT){
        // és una referència
        this->esReferencia = true;

        // comprovar que efectivament id és una constant / variable d'un tipus array
        DescripcioTipus *dt = nullptr;
        std::string tipus;

        if(d->getTipus() == Descripcio::Tipus::VARIABLE){
            tipus = ((DescripcioVariable *) d)->getNomTipus();
            this->mode = SimbolReferencia::ModeMVP::VAR;
        }else{
            tipus = ((DescripcioConstant *) d)->getNomTipus();
            this->mode = SimbolReferencia::ModeMVP::CONST;
        }

        // obtenir el tsb (sabem que el tipus existeix sí o sí perquè s'haurà
        // inserit automàticament en definir una variable d'aquest tipus)
        dt = (DescripcioTipus *) driver->ts.consulta(tipus);

        if(dt->getTSB() != TipusSubjacentBasic::ARRAY){
            // no és un array! error
            this->makeNull();
            driver->error("no és un array");
            return;
        }

        this->tipusBasic = ((DescripcioTipusArray *) dt)->getTipusElement();

        // comprovar que l'expressió correspon a un valor numèric
        if(exp.getTSB() != TipusSubjacentBasic::INT){
            this->makeNull();
            driver->error("index no numèric");
            return;
        }

        // Consultar que té una dimensió (que la tendrà)
        this->it = driver->ts.getDimensions();
        this->it.first(tipus);

        DescripcioDimensio *ddim = (DescripcioDimensio *) this->it.get();

        // i si és una constant comprovar que el seu valor és dins el rang permès per les dimensions
        if(exp.getMode() == SimbolExpressio::Mode::CONST){
            if(exp.getIntValue() < 0 && exp.getIntValue() >= ddim->getDimensio()){
                driver->error("index out of bounds");
                this->makeNull();
                return;
            }
        }

        this->id = id;
        this->tipus = tipus;
        this->tsb = TipusSubjacentBasic::ARRAY;
    }
}

void SimbolTipusArray::make(Driver *driver, SimbolTipusArray contArray, SimbolExpressio exp){
    if(exp.isNull()){
        // expressió mal formada
        this->makeNull();
        return;
    }
    
    this->esReferencia = contArray.esReferencia;

    if(contArray.esReferencia){
        if(exp.getTSB() != TipusSubjacentBasic::INT){
            this->makeNull();
            driver->error("no és un enter");
            return;
        }

        this->it = contArray.it;
        this->it.next();

        if(!this->it.valid()){
            // s'han introduit massa dimensions!
            this->makeNull();
            driver->error("massa dimensions");
            return;
        }

        DescripcioDimensio *ddim = (DescripcioDimensio *) this->it.get();

        // si l'expressió és constant, comprovar que és dins els límits
        if(exp.getMode() == SimbolExpressio::Mode::CONST){
            if(exp.getIntValue() < 0 || exp.getIntValue() >= ddim->getDimensio()){
                this->makeNull();
                driver->error("index out of bounds");
                return;
            }
        }
        
        this->tipus = contArray.tipus;
        this->tsb = contArray.tsb;
        this->mode = contArray.mode;
        this->id = contArray.id;
        this->tipusBasic = contArray.tipusBasic;
    }else{
        // s'està definint un array, el vector dimensions conté la llista de dimensions
        // trobades fins a aquest instant
        this->dimensions = contArray.dimensions;
        this->esReferencia = false;
        this->tipusBasic = contArray.tipusBasic;

        // comprovar que l'expressió és una constant entera positiva
        if(exp.getMode() == SimbolExpressio::Mode::CONST && exp.getTSB() == TipusSubjacentBasic::INT){
            // existeix un valor numèric, comprovar que és positiu
            int dimensio = exp.getIntValue();

            if(dimensio < 0){
                driver->error("els array han de tenir dimensions positives");
                return;
            }else{
                // és un valor vàlid, es pot afegir aquesta dimensió a la llista de 
                // dimensions
                this->dimensions.push_back(dimensio);
            }
        }else{
            driver->error("s'espera constant entera", true);
            return;
        }
    }
}


void SimbolTipusArray::make(Driver *driver){
    if(this->esReferencia){
        // comprovar que no s'esperen més dimensions
        this->it.next();

        if(this->it.valid()){
            // s'esperen més dimensions però no s'han proporcionat
            this->makeNull();
            driver->error("s'esperen més dimensions");
            return;
        }

        // obtenir el tipus elemental de l'array
        DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(this->tipusBasic);

        this->tipus = this->tipusBasic;
        this->tsb = dt->getTSB();
    }else{
        // afegir aquest tipus array a la taula de símbols si no existeix
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
}

/**
 * Insereix una dimensió a l'array actual
 */
/*
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
*/
/**
 * Estableix el tipus dels elements de l'array.
 * contArray -> id
 */
/*
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
*/
/**
 * Insereix un tipus array si no existeix a la taula de símbols
 * array -> contArray [ INT_LITERAL ]
 */
/*
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
}*/

/**
 * Obté el nom que representa un array.
 * Per exemple, int[50][75] és _int_50_75
 **/
std::string SimbolTipusArray::toString(){
    if(this->esReferencia){
        // no es pot utilitzar quan s'utilitza com a 
        // definició de tipus
        return "";
    }

    std::string tmp = "_" + this->tipusBasic + "_";

    int mida = (int) dimensions.size();
    for(int i = 0; i < mida - 1; i++){
        tmp += std::to_string(dimensions[i]) + "_";
    }

    tmp += std::to_string(dimensions[mida - 1]);

    return tmp;
}

bool SimbolTipusArray::isReferencia(){
    return this->esReferencia;
}