#include "SimbolVarDecl.h"
#include "../taulasimbols/Descripcio.h"
#include "../taulasimbols/DescripcioVar.h"
#include "../taulasimbols/DescripcioConstant.h"
#include "../Driver.h"

SimbolVarDecl::SimbolVarDecl() : Simbol("VarDecl") {}
SimbolVarDecl::~SimbolVarDecl(){}

/**
 * varDecl -> const Tipus ID varInit
 * varDecl -> Tipus ID varInit
 */
void SimbolVarDecl::make(Driver *driver, std::string tipus, std::string id, SimbolVarInit init, bool constant){
    // Comprovar que el tipus és vàlid
    Descripcio* d = nullptr;
    try{
        d = driver->ts.consulta(tipus);

        if(d->getTipus() != Descripcio::Tipus::TIPUS){
            driver->error("Tipus no reconegut! ("+ tipus +")" , true);
        }
    }catch(TaulaSimbols::NomNoExistent ex){
        driver->error("Tipus no reconegut! (" + tipus + ")" , true);
    }

    DescripcioTipus *dt = (DescripcioTipus *) d;

    // Comprovar, si hi ha inicialització, que els tipus són compatibles
    if(!init.isEmpty()){
        // tipus != id_nul
        if(init.getTipus() != tipus){
            if(init.getTSB() != dt->getTSB() || init.getTSB() == TipusSubjacentBasic::ARRAY){
                // si són arrays han de tenir exactament les mateixes dimensions
                // i el mateix tipus unitari, que està dins el nom del tipus
                driver->error("tipus no compatibles" + tipus + " vs " + init.getTipus(), true);
                return;
            }
        }
    }

    this->tsb = dt->getTSB();
    this->tipus = tipus;

    Descripcio *desc = nullptr;
    if (constant){
        // És necessari inicialitzar les constants quan es declaren
        if (init.isEmpty()){
            driver->error("Constant "+ id + " sense valor", true);
            return;
        }

        // Comprovar que la inicialització també és un valor constant
        if(init.getMode() != SimbolExpressio::Mode::CONST){
            driver->error("valor no constant", true);
            return;
        }

        // Crear la constant i assignar el seu valor
        this->esConst = true;

        DescripcioConstant* dc = new DescripcioConstant(tipus);

        switch(dt->getTSB()){
            case TipusSubjacentBasic::INT:
                dc->setIntValue(init.getIntValue());
                break;

            case TipusSubjacentBasic::CHAR:
                dc->setCharValue(init.getCharValue());
                break;

            case TipusSubjacentBasic::BOOLEAN:
                dc->setBoolValue(init.getBoolValue());
                break;
            case TipusSubjacentBasic::ARRAY:
                // pot ser un array de qualsevol tipus bàsic
                // o un string
                break;
        }

        desc = dc;
    }else{
        // és una variable
        DescripcioVariable* dv = new DescripcioVariable(tipus);
        desc = dv;
    }

    // Inserir la variable o constant, és possible que no es pugui inserir
    try {
        driver->ts.posar(id, desc);
    } catch(TaulaSimbols::NomExistent){
        driver->error("No es pot redefinir " + id, true);
        return;
    }
}

/**
 * varDecl -> varDecl , ID varInit
 */
void SimbolVarDecl::make(Driver *driver, SimbolVarDecl varDecl, std::string id, SimbolVarInit init){
    // Comprovar, si hi ha inicialització, que els tipus són compatibles
    if(!init.isEmpty()){
        // tipus != id_nul
        if(init.getTipus() != tipus){
            if(init.getTSB() != this->tsb || init.getTSB() == TipusSubjacentBasic::ARRAY){
                // si són arrays han de tenir exactament les mateixes dimensions
                // i el mateix tipus unitari, que està dins el nom del tipus
                driver->error("tipus no compatibles", true);
                return;
            }
        }
    }

    this->tipus = varDecl.tipus;
    this->tsb = varDecl.tsb;
    this->esConst = varDecl.esConst;

    Descripcio *desc = nullptr;

    if (varDecl.esConst){
        // És necessari inicialitzar les constants quan es declaren
        if (init.isEmpty()){
            driver->error("Constant "+ id + " sense valor", true);
            return;
        }

        // Comprovar que la inicialització també és un valor constant
        if(init.getMode() != SimbolExpressio::Mode::CONST){
            driver->error("valor no constant", true);
            return;
        }

        DescripcioConstant* dc = new DescripcioConstant(tipus);

        switch(this->tsb){
            case TipusSubjacentBasic::INT:
                dc->setIntValue(init.getIntValue());
                break;

            case TipusSubjacentBasic::CHAR:
                dc->setCharValue(init.getCharValue());
                break;

            case TipusSubjacentBasic::BOOLEAN:
                dc->setBoolValue(init.getBoolValue());
                break;
            case TipusSubjacentBasic::ARRAY:
                // pot ser un array de qualsevol tipus bàsic
                // o un string
                break;
        }

        desc = dc;
    }else{
        DescripcioVariable *dv = new DescripcioVariable(tipus);
        desc = dv;
    }

    // Inserir la variable o constant, és possible que no es pugui inserir
    try {
        driver->ts.posar(id, desc);
    } catch(TaulaSimbols::NomExistent){
        driver->error("No es pot redefinir " + id, true);
        return;
    }
}
