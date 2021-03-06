#include "SimbolArrayInit.h"
#include "../Driver.h"
#include "../code/instructions/AssignmentInstruction.h"

#include <iostream>
#include <cstring>

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
        driver->error( error_no_definit(tipusBasic), true);
    }

    if(d->getTipus() != Descripcio::Tipus::TIPUS){
        driver->error( error_no_tipus(tipusBasic) , true);
        return;
    }

    DescripcioTipus *dt = (DescripcioTipus *) d;

    // Comprovar que no és un array perquè no es permet la creació
    // d'arrays
    if(dt->getTSB() == TipusSubjacentBasic::ARRAY){
        driver->error(error_creacio_array(dt->getTSB()), true);
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
            driver->error( error_tipus_no_compatibles(tipusBasic), false);
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

    if(!this->match){
        // no està ben format, afegir un caràcter per provocar un error
        // de tipus a la inicialització
        this->tipus += "_";
    }

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, tipusBasic + "{") );
    this->fills.push_back( std::to_string(list.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "}") );
    Simbol::toDotFile(driver);

	// generació de codi
	this->r = driver->code.addVariable(TipusSubjacentBasic::ARRAY);

	// reservar espai pels elements
	this->r->setOcupacioExtra(dt->getOcupacio() * elements.size());
	this->d = nullptr;

	// guardar els elements (copiar només els valors)
	int mida = dt->getOcupacio();
	char *buffer = new char[mida * list.getElements().size()];

	unsigned int offset = 0;
	for(int i = 0; i < elements.size(); i++){
		ValueContainer *valor = elements[i].getValue().get();
		memcpy(buffer + offset, valor->get(), valor->getSize());

		// inicialitzar l'array
        Variable *varOffset = driver->code.addVariable(TipusSubjacentBasic::INT);
		driver->code.addInstruction(new AssignmentInstruction(
			TipusSubjacentBasic::INT,
			varOffset,
			std::make_shared<ValueContainer>((const char *) &offset, sizeof(int))
		));

		driver->code.addInstruction(new AssignmentInstruction(
			AssignmentInstruction::Type::TARGET_OFF,
			this->r, // base
			elements[i].dereference(driver, elements[i].getTSB()),
			varOffset
		));

		offset += valor->getSize();
	}

	this->value = std::make_shared<ValueContainer>(buffer, mida * list.getElements().size());
	delete []buffer;
}

bool SimbolArrayInit::coincideixen(){
    return this->match;
}