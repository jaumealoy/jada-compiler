#include "SimbolVarDecl.h"
#include "../taulasimbols/Descripcio.h"
#include "../taulasimbols/DescripcioVar.h"
#include "../taulasimbols/DescripcioConstant.h"
#include "../Driver.h"
#include "../code/instructions/AssignmentInstruction.h"
#include "../code/instructions/MemoryInstruction.h"

#include <string>

SimbolVarDecl::SimbolVarDecl() : Simbol("VarDecl") {}
SimbolVarDecl::~SimbolVarDecl(){}

/**
 * varDecl -> const Tipus ID varInit
 * varDecl -> Tipus ID varInit
 */
void SimbolVarDecl::make(Driver *driver, SimbolTipus tipus, std::string id, SimbolVarInit init, bool constant){
    // Comprovar que el tipus és vàlid
    Descripcio* d = nullptr;
    try{
        d = driver->ts.consulta(tipus);

        if(d->getTipus() != Descripcio::Tipus::TIPUS){
            driver->error(error_no_tipus(tipus));
            return;
        }
    }catch(TaulaSimbols::NomNoExistent ex){
        driver->error(error_no_tipus(tipus));
        return;
    }

    // Comprovar que el nom de la variable/constant no és una funció
    try {
        Descripcio *dp = driver->ts.consulta(id);

        if(dp->getTipus() == Descripcio::Tipus::FUNCIO || dp->getTipus() == Descripcio::Tipus::PROCEDIMENT){
            driver->error( error_nom_parametre_nom_funcio(), true );
        }
    } catch(TaulaSimbols::NomNoExistent ex) {

    }

    DescripcioTipus *dt = (DescripcioTipus *) d;

    // Comprovar, si hi ha inicialització, que els tipus són compatibles
    if(!init.isEmpty()){
        // tipus != id_nul
        if(init.getTipus() != (std::string) tipus){
            if(init.getTSB() != dt->getTSB() || init.getTSB() == TipusSubjacentBasic::ARRAY){
                // si són arrays han de tenir exactament les mateixes dimensions
                // i el mateix tipus unitari, que està dins el nom del tipus
                driver->error(error_tipus_no_compatibles(tipus), true);
                return;
            }
        }

        if(init.getTSB() == TipusSubjacentBasic::POINTER && init.getMode() != SimbolExpressio::Mode::RESULTAT){
            // incrementar la referència del punter
            driver->code.addInstruction(new MemoryInstruction(
                init.getBase(),
                MemoryInstruction::Type::INCREMENT
            ));
        }
    }

    this->tsb = dt->getTSB();
    this->tipus = tipus;

    std::cout << "=====> defininint variable de tipus " << this->tipus << std::endl;

	Variable *var = driver->code.addVariable(this->tsb, id);

	if(this->tsb == TipusSubjacentBasic::ARRAY){
		// si és un array, indicar que té un espai addicional
		if(init.isEmpty()){
			// no hi ha inicialització, no hi ha espai reservat
			var->setOcupacioExtra(dt->getOcupacio());
		}else{
			// assignar l'adreça de la variable temporal
			driver->code.addInstruction(new AssignmentInstruction(
				var,
				init.getBase()
			));
		}
	}else if(this->tsb == TipusSubjacentBasic::POINTER){
		// no es reserva espai pel punter
		var->setOcupacioExtra(0);

		if(this->tipus == "string" && init.isEmpty()){
			var->setOcupacioExtra(256);
		}
	}

    Descripcio *desc = nullptr;
    if (constant){
        // És necessari inicialitzar les constants quan es declaren
        if (init.isEmpty()){
            driver->error(error_constant_no_inicialitzada(id), true);
            return;
        }

        // Comprovar que la inicialització també és un valor constant
        if(init.getMode() != SimbolExpressio::Mode::CONST){
            driver->error( error_valor_no_constant() , true);
            return;
        }

        // Crear la constant i assignar el seu valor
        this->esConst = true;

        DescripcioConstant* dc = new DescripcioConstant(tipus);

		// tots els valors es tracten igual
		dc->setValue(init.getValue());
        desc = dc;

		dc->setVariable(var);
		if(!init.isEmpty()){
			driver->code.addInstruction(
				new AssignmentInstruction(
					dc->getVariable(), 
					init.dereference(driver, init.getTSB())
				)
			);
		}
    }else{
        // és una variable
        DescripcioVariable* dv = new DescripcioVariable(tipus);
        desc = dv;

		dv->setVariable(var);
		if(!init.isEmpty()){
			driver->code.addInstruction(
				new AssignmentInstruction(
					dv->getVariable(), 
					init.dereference(driver, init.getTSB())
				)
			);
		}
    }

    // Inserir la variable o constant, és possible que no es pugui inserir
    try {
        driver->ts.posar(id, desc);
    } catch(TaulaSimbols::NomExistent){
        driver->error(error_redefinicio(id));
        return;
    }

    // pintar a l'arbre
    if(esConst){
        this->fills.push_back( driver->addTreeChild(this, "const") );
    }

    this->fills.push_back( std::to_string(tipus.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, id) );
    this->fills.push_back( std::to_string(init.getNodeId()) );
    Simbol::toDotFile(driver);
}

/**
 * varDecl -> varDecl , ID varInit
 */
void SimbolVarDecl::make(Driver *driver, SimbolVarDecl varDecl, std::string id, SimbolVarInit init){
    // Comprovar que el nom de la variable/constant no és una funció
    try {
        Descripcio *dp = driver->ts.consulta(id);

        if(dp->getTipus() == Descripcio::Tipus::FUNCIO || dp->getTipus() == Descripcio::Tipus::PROCEDIMENT){
            driver->error( error_nom_parametre_nom_funcio(), true );
        }
    } catch(TaulaSimbols::NomNoExistent ex) {

    }

    // Comprovar, si hi ha inicialització, que els tipus són compatibles
    if(!init.isEmpty()){
        // tipus != id_nul
        if(init.getTipus() != tipus){
            if(init.getTSB() != this->tsb || init.getTSB() == TipusSubjacentBasic::ARRAY){
                // si són arrays han de tenir exactament les mateixes dimensions
                // i el mateix tipus unitari, que està dins el nom del tipus
                driver->error( error_tipus_no_compatibles(this->tsb, init.getTSB()) , true);
                return;
            }
        }

        if(init.getTSB() == TipusSubjacentBasic::POINTER && init.getMode() != SimbolExpressio::Mode::RESULTAT){
            // incrementar la referència del punter
            driver->code.addInstruction(new MemoryInstruction(
                init.getBase(),
                MemoryInstruction::Type::INCREMENT
            ));
        }
    }

    this->tipus = varDecl.tipus;
    this->tsb = varDecl.tsb;
    this->esConst = varDecl.esConst;

	Variable *var = driver->code.addVariable(this->tsb, id);
	
	if(this->tsb == TipusSubjacentBasic::ARRAY){
		// si és un array, indicar que té un espai addicional
		if(init.isEmpty()){
			// no hi ha inicialització, no hi ha espai reservat
			DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(this->tipus);
			var->setOcupacioExtra(dt->getOcupacio());
		}else{
			// assignar l'adreça de la variable temporal
			driver->code.addInstruction(new AssignmentInstruction(
				var,
				init.getBase()
			));
		}
	}else if(this->tsb == TipusSubjacentBasic::POINTER){
		// no es reserva espai pel punter
		var->setOcupacioExtra(0);

		if(this->tipus == "string" && init.isEmpty()){
			var->setOcupacioExtra(256);
		}
	}

    Descripcio *desc = nullptr;

    if (varDecl.esConst){
        // És necessari inicialitzar les constants quan es declaren
        if (init.isEmpty()){
            driver->error(error_constant_no_inicialitzada(id), true);
            return;
        }

        // Comprovar que la inicialització també és un valor constant
        if(init.getMode() != SimbolExpressio::Mode::CONST){
            driver->error(error_valor_no_constant(), true);
            return;
        }

        DescripcioConstant* dc = new DescripcioConstant(tipus);

		// tots els valors constants es tracten igual
		dc->setValue(init.getValue());
        desc = dc;

		dc->setVariable(var);
		if(!init.isEmpty()){
			driver->code.addInstruction(
				new AssignmentInstruction(
					dc->getVariable(),
					init.dereference(driver, init.getTSB())
				)
			);
		}
    }else{
        DescripcioVariable *dv = new DescripcioVariable(tipus);
        desc = dv;

		dv->setVariable(var);
		if(!init.isEmpty()){
			driver->code.addInstruction(
				new AssignmentInstruction(
					dv->getVariable(), 
					init.dereference(driver, init.getTSB())
				)
			);
		}
    }

    // Inserir la variable o constant, és possible que no es pugui inserir
    try {
        driver->ts.posar(id, desc);
    } catch(TaulaSimbols::NomExistent){
        driver->error(error_redefinicio(id));
        return;
    }

    // pintar a l'arbre
    this->fills.push_back( std::to_string(varDecl.getNodeId()) );
    this->fills.push_back( driver->addTreeChild(this, ", " + id) );
    this->fills.push_back( std::to_string(init.getNodeId()) );
    Simbol::toDotFile(driver);
}
