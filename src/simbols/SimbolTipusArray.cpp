#include "SimbolTipusArray.h"
#include "../Driver.h"
#include "SimbolExpressio.h"
#include "../code/instructions/AssignmentInstruction.h"
#include "../code/instructions/ArithmeticInstruction.h"
#include <iostream>
#include <memory>

SimbolTipusArray::SimbolTipusArray() : SimbolReferencia(), dimensions() {
    this->nomNode = "TipusArray";
}

SimbolTipusArray::~SimbolTipusArray() {}

/**
 * Per la naturalesa de JADA (i de la seva gramàtica) les produccions
 * associades als arrays (la vinculada amb el Tipus i la referència)
 * - a efectes de símbols terminals - són indistingibles.
 * Per aquest motiu és necessari realitzar comprovacions estrictes
 * en el semàntic.
 * 
 * Si el primer identificador que es troba (contArray -> ID) és
 * un tipus bàsic (int, string, char) es considerarà que s'està
 * fent una declaració de tipus. En canvi, si és una variable o 
 * constant se considerarà que s'està fent una referència.
 */


/**
 * contArray -> id [ exprSimple ]
 */
void SimbolTipusArray::make(Driver *driver, std::string id, SimbolExpressio exp){
    // Comprovar si s'està fent una referència o definició d'array
    Descripcio *d = nullptr;
    try {
        d = driver->ts.consulta(id);
    } catch (TaulaSimbols::NomNoExistent ex) {
        // no és res, el nom no existeix
        this->makeNull();
        this->esReferencia = true;
        driver->error( error_no_definit(id) , true);
        return;
    }

    // d != nullptr
    if(d->getTipus() == Descripcio::Tipus::TIPUS){
        // es vol definir un array
        this->esReferencia = false;
        this->tipusBasic = id;

        DescripcioTipus *dt = (DescripcioTipus *) d;
        if(dt->getTSB() == TipusSubjacentBasic::ARRAY){
            this->makeNull();
            driver->error(error_creacio_array(TipusSubjacentBasic::ARRAY), true);
            return;
        }

        // és necessari que l'expressió estigui formada únicament per valors constants
        // i que es puguin calcular en temps de compilació
        if(!exp.isNull() && exp.getMode() == SimbolExpressio::Mode::CONST && exp.getTSB() == TipusSubjacentBasic::INT){
            // existeix un valor numèric, comprovar que és positiu
            int dimensio = *(int *) exp.getValue()->get();

            if(dimensio < 0){
                driver->error(error_fora_de_rang(dimensio));
                return;
            }else{
                // és un valor vàlid, es pot afegir aquesta dimensió a la llista de 
                // dimensions
                this->dimensions.push_back(dimensio);
            }
        }else{
            driver->error(error_valor_no_constant(TipusSubjacentBasic::INT), true);
            this->makeNull();
            return;
        }
    }else if(d->getTipus() == Descripcio::Tipus::VARIABLE || d->getTipus() == Descripcio::Tipus::CONSTANT){
        if(exp.isNull()){
            // expressió malformada
            this->makeNull();
            return;
        }

        // és una referència
        this->esReferencia = true;

        // comprovar que efectivament id és una constant / variable d'un tipus array
        DescripcioTipus *dt = nullptr;
        std::string tipus;

        if(d->getTipus() == Descripcio::Tipus::VARIABLE){
            tipus = ((DescripcioVariable *) d)->getNomTipus();
            this->mode = SimbolReferencia::ModeMVP::VAR;
			this->r =  ((DescripcioVariable *) d)->getVariable();
        }else{
            tipus = ((DescripcioConstant *) d)->getNomTipus();
            this->mode = SimbolReferencia::ModeMVP::CONST;
			this->r =  ((DescripcioConstant *) d)->getVariable();
        }

		this->d = nullptr;

        // obtenir el tsb (sabem que el tipus existeix sí o sí perquè s'haurà
        // inserit automàticament en definir una variable d'aquest tipus)
        dt = (DescripcioTipus *) driver->ts.consulta(tipus);

        if(dt->getTSB() != TipusSubjacentBasic::ARRAY){
            // no és un array! error
            this->makeNull();
            driver->error(error_tipus_esperat(TipusSubjacentBasic::ARRAY));
            return;
        }

        this->tipusBasic = ((DescripcioTipusArray *) dt)->getTipusElement();

        // comprovar que l'expressió correspon a un valor numèric
        if(exp.getTSB() != TipusSubjacentBasic::INT){
            this->makeNull();
            driver->error(error_tipus_esperat(TipusSubjacentBasic::INT));
            return;
        }

        // Consultar que té una dimensió (que la tendrà)
        this->it = driver->ts.getDimensions();
        this->it.first(tipus);

        DescripcioDimensio *ddim = (DescripcioDimensio *) this->it.get();

        // i si és una constant comprovar que el seu valor és dins el rang permès per les dimensions
        if(exp.getMode() == SimbolExpressio::Mode::CONST){
			int tmpValue = *(int *) exp.getValue()->get();
            if(tmpValue < 0 || tmpValue >= ddim->getDimensio()){
                driver->error( error_fora_de_rang(tmpValue) );
                this->makeNull();
                return;
            }
        }

        this->id = id;
        this->tipus = tipus;
        this->tsb = TipusSubjacentBasic::ARRAY;

		// tot ha anat bé, s'ha de guardar informació per consultar el número d'element
		struct SimbolTipusArray::ArrayIndex tmp;
		tmp.index = exp;
		tmp.dimensio = ddim;
		this->refIndex.push_back(tmp);
    }

    // pintar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, id + "[") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "]") );
    Simbol::toDotFile(driver);
}

/**
 * contArray -> contArray [ exprSimple ]
 */
void SimbolTipusArray::make(Driver *driver, SimbolTipusArray contArray, SimbolExpressio exp){
    this->esReferencia = contArray.esReferencia;

    if(contArray.esReferencia){
        if(exp.isNull()){
            // expressió mal formada
            this->makeNull();
            return;
        }
    
        if(exp.getTSB() != TipusSubjacentBasic::INT){
            this->makeNull();
            driver->error( error_tipus_esperat(TipusSubjacentBasic::INT) );
            return;
        }

        this->it = contArray.it;
        this->it.next();

        if(!this->it.valid()){
            // s'han introduit massa dimensions!
            this->makeNull();
            driver->error( error_sobren_dimensions() );
            return;
        }

        DescripcioDimensio *ddim = (DescripcioDimensio *) this->it.get();

        // si l'expressió és constant, comprovar que és dins els límits
        if(exp.getMode() == SimbolExpressio::Mode::CONST){
			int tmpValue = *(int *) exp.getValue()->get();
            if(tmpValue < 0 || tmpValue >= ddim->getDimensio()){
                this->makeNull();
                driver->error( error_fora_de_rang(tmpValue) );
                return;
            }
        }
        
        this->tipus = contArray.tipus;
        this->tsb = contArray.tsb;
        this->mode = contArray.mode;
        this->id = contArray.id;
        this->tipusBasic = contArray.tipusBasic;

		// afegir l'índex que s'ha processat a la llista d'índexos
		this->refIndex = contArray.refIndex;

		struct SimbolTipusArray::ArrayIndex tmp;
		tmp.index = exp;
		tmp.dimensio = ddim;
		this->refIndex.push_back(tmp);

		this->r = contArray.r;
		this->d = contArray.d;
    }else{
        // s'està definint un array, el vector dimensions conté la llista de dimensions
        // trobades fins a aquest instant
        this->dimensions = contArray.dimensions;
        this->esReferencia = false;
        this->tipusBasic = contArray.tipusBasic;

        // comprovar que l'expressió és una constant entera positiva
        if(!exp.isNull() && exp.getMode() == SimbolExpressio::Mode::CONST && exp.getTSB() == TipusSubjacentBasic::INT){
            // existeix un valor numèric, comprovar que és positiu
            int dimensio = *(int*) exp.getValue()->get();

            if(dimensio < 0){
                driver->error( error_fora_de_rang(dimensio) );
                return;
            }else{
                // és un valor vàlid, es pot afegir aquesta dimensió a la llista de 
                // dimensions
                this->dimensions.push_back(dimensio);
            }
        }else{
            driver->error(error_valor_no_constant(TipusSubjacentBasic::INT), true);
            return;
        }
    }

    // pintar a l'arbre
    this->fills.push_back( std::to_string(contArray.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "[") );
    this->fills.push_back( std::to_string(exp.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, "]") );
    Simbol::toDotFile(driver);
}

/**
 * array -> contArray
 */
void SimbolTipusArray::make(Driver *driver, SimbolTipusArray array){
    if(array.esReferencia){
        if(array.isNull()){
            this->makeNull();
            return;
        }

        this->tipusBasic = array.tipusBasic;
        this->it = array.it;
        this->id = array.id;

        // comprovar que no s'esperen més dimensions
        this->it.next();

        if(this->it.valid()){
            // s'esperen més dimensions però no s'han proporcionat
            this->makeNull();
            driver->error( error_falten_dimensions() );
            return;
        }

        // obtenir el tipus elemental de l'array
        DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(this->tipusBasic);

        this->tipus = this->tipusBasic;
        this->tsb = dt->getTSB();
        this->mode = array.mode;
        this->esReferencia = true;

		// TODO: generació de codi si no és tot constant
		// Si tot és constant, numElement representa el número d'índex que 
		// es vol consultar. En cas contrari, numElement representa la variable
		// que conté el número de l'element
		int productori = 1;
		bool totConstant = true;
		int numElement = 0;
		this->refIndex = array.refIndex;

		// calcular el desplaçament en temps d'execució
		this->d = driver->code.addVariable(TipusSubjacentBasic::INT);
		int intValue = 0; // TODO: falta determinar si es vol indicar el començament 
						  // de l'element o el final (ara mateix indicaria el final)
		driver->code.addInstruction(new AssignmentInstruction(
			TipusSubjacentBasic::INT,
			this->d,
			std::make_shared<ValueContainer>((const char *) &intValue, sizeof(int))
		));

		for(int i = this->refIndex.size() - 1; i >= 0; i--){
			Variable *tmp = this->refIndex[i].index.dereference(driver, this->refIndex[i].index.getTSB());
			Variable *paux = driver->code.addVariable(TipusSubjacentBasic::INT);

			// carregar productori dins variable temporal
			driver->code.addInstruction(new AssignmentInstruction(
				TipusSubjacentBasic::INT,
				paux,
				std::make_shared<ValueContainer>((const char *) &productori, sizeof(int))
			));

			// multiplicar productori per valor de l'índex
			driver->code.addInstruction(new ArithmeticInstruction(
				ArithmeticInstruction::Type::MULTIPLICATION,
				paux,
				paux,
				tmp
			));

			// sumar el desplaçament
			driver->code.addInstruction(new ArithmeticInstruction(
				ArithmeticInstruction::Type::ADDITION,
				this->d,
				this->d,
				paux
			));

			productori *= this->refIndex[i].dimensio->getDimensio();
		}

		this->r = array.r;


		/*for(int i = this->refIndex.size() - 1; i >= 0; i--){
			totConstant = totConstant && this->refIndex[i].index.getMode() == SimbolExpressio::Mode::CONST;

			if(this->refIndex[i].index.getMode() == SimbolExpressio::Mode::CONST){
				numElement += productori * *(int *) this->refIndex[i].index.getValue()->get();
			}
			
			productori *= this->refIndex[i].dimensio->getDimensio();
		}
		this->accessConstant = totConstant;

		if(totConstant){
			this->dconst = numElement * dt->getOcupacio();
		}*/

		std::cout << "Es vol accedir a l'element " << numElement << std::endl;
    }else{
        if(array.isNull()){
            this->makeNull();
            return;
        }

        // afegir aquest tipus array a la taula de símbols si no existeix
        std::string nomTipus = array.toString();
        this->esReferencia = false;

        // és possible que aquest array ja estigui definit
        // en aquest cas, no s'hauria d'inserir
        try {
            Descripcio *dexistent = driver->ts.consulta(nomTipus);

            // el nomTipus comença amb un caràcter especial, per tant,
            // si existeix, segur que serà una descripció de tipus
        } catch(TaulaSimbols::NomNoExistent ex) {
            // el nom no existeix, s'ha d'inserir el tipus
            DescripcioTipusArray *dt = new DescripcioTipusArray(array.tipusBasic);
            driver->ts.posar(nomTipus, dt);

            // obtenir la mida del tipus unitari
            // sabem que existeix perquè si no ja no s'hauria arribat fins aquest punt
            DescripcioTipus *dte = (DescripcioTipus *) driver->ts.consulta(array.tipusBasic);

            int ocupacio = dte->getOcupacio();

            // i crear les dimensions, inserint-les en ordre invers
            for(int i = array.dimensions.size() - 1; i >= 0; i--){
                ocupacio *= array.dimensions[i];
                driver->ts.posarDimensio(nomTipus, new DescripcioDimensio(array.dimensions[i]));
            }

            // actualitzar l'entrada de la taula de símbols
            dt->setOcupacio(ocupacio);
        }

        this->tipusBasic = array.tipusBasic;
        this->dimensions = array.dimensions;
        this->tipus = nomTipus;
    }

    // pintar a l'arbre
    this->nomNode = "Array";
    this->fills.push_back( std::to_string(array.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * Obté el nom que representa un array.
 * Per exemple, int[50][75] és _int_50_75
 **/
std::string SimbolTipusArray::toString(){
    if(this->esReferencia || this->isNull()){
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

bool SimbolTipusArray::isAccessConstant(){
	return this->accessConstant;
}