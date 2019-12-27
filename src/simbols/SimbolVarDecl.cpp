#include "SimbolVarDecl.h"
#include "../taulasimbols/Descripcio.h"
#include "../taulasimbols/DescripcioVar.h"
#include "../taulasimbols/DescripcioConstant.h"
#include "../Driver.h"

SimbolVarDecl::SimbolVarDecl() : Simbol() {

}

SimbolVarDecl::~SimbolVarDecl(){}

void SimbolVarDecl::make(Driver *driver, std::string tipus, std::string id, SimbolVarInit init, bool constant){
    try{
        Descripcio* d = driver->ts.consulta(tipus);

        //if(d->getTipus() != Descripcio::Tipus::TIPUS){
            //std::cout << "Tipus no reconegut! ("<< tipus << ")" << std::endl;
            //driver->error("Tipus no reconegut! ("/* << tipus << */")" , true);
        //}
            
    }catch(TaulaSimbols::NomNoExistent ex){
        driver->error("Tipus no reconegut! (" + tipus + ")" , true);
    }
    this->tipus = tipus;
    if (constant){
        this->esConst = true;
        if (init.isEmpty()){
            driver->error("Constant "+ id + " sense valor", true);
        }
        DescripcioConstant* desc = new DescripcioConstant(tipus);
        driver->ts.posar(id, desc);
        std::cout << "Trobada constant " << id << " de tipus " << tipus << std::endl;

    }
    else{
        DescripcioVariable* desc = new DescripcioVariable(tipus);
        driver->ts.posar(id, desc);
        std::cout << "Trobada variable " << id << " de tipus " << tipus << std::endl;
    }
    if (!init.isEmpty()){ //Comprovació de tipus
        DescripcioTipus* desc = (DescripcioTipus*) driver->ts.consulta(this->tipus);

        if (init.getTSB() != desc->getTSB()){
            driver->error("Variable "+id+" assignada a un tipus incorrecte.", true);
        }
    }

}

void SimbolVarDecl::make(Driver *driver, SimbolVarDecl varDecl, std::string id, SimbolVarInit init){
    this->tipus = varDecl.tipus;
    if (varDecl.esConst){
        this->esConst = true;
        if (init.isEmpty()){
            driver->error("Constant "+ id + " sense valor", true);
        }
        DescripcioConstant* desc = new DescripcioConstant(tipus);
        driver->ts.posar(id, desc);
        std::cout << "Trobada constant " << id << " de tipus " << tipus << std::endl;
    }
    else{
        DescripcioVariable* desc = new DescripcioVariable(tipus);
        driver->ts.posar(id, desc);
        std::cout << "Trobada variable " << id << " de tipus " << tipus << std::endl;
    }
    if (!init.isEmpty()){ //Comprovació de tipus
        DescripcioTipus* desc = (DescripcioTipus*) driver->ts.consulta(this->tipus);
        if (init.getTSB() != desc->getTSB()){
            driver->error("Variable "+id+" assignada a un tipus incorrecte.", true);
        }
    }
}
