#include "SimbolFuncDecl.h"
#include "../Driver.h"

SimbolFuncDecl::SimbolFuncDecl() : Simbol("FuncDecl") {}
SimbolFuncDecl::~SimbolFuncDecl() {}

void SimbolFuncDecl::make(Driver *driver, SimbolFuncCap cap, SimbolBloc bloc, std::string nom){
    // Comprovar que els noms de la capçalera i l'end coincideixen
    if(cap.getNomFuncio() != nom){
        // error (no crític)
        driver->error("s'ha trobat " + nom + " i s'esperava " + cap.getNomFuncio());
    }

    // Comprovar que no hi ha cap instrucció prohibida al bloc (com pot ser un break)
    if(bloc.conteBreak()){
        // error (crític)
        driver->error("un break només ha d'estar dins un while");
    }

    if(bloc.conteReturn()){
        // Comprovar que els tipus són compatibles
        // 1. Obtenir el tipus de retorn de la funció
        DescripcioFuncio *df = (DescripcioFuncio *) driver->ts.consulta(cap.getNomFuncio());

        // Hem de comprovar que cada un dels returns és compatible amb el valor de 
        // retorn de la funció
        std::vector<struct ControlInstruccions::ReturnData> returns = bloc.getReturns();
        for(int i = 0; i < returns.size(); i++){
            struct ControlInstruccions::ReturnData ret = returns[i];

            // 2. És possible que el valor de retorn sigui anònim (constant, resultat)
            if(ret.tipus.empty()){
                // no es té un tipus concret
                // comprovar si els tipus subjacents són compatibles (del mateix tipus)
                // 2.1 Obtenir el tipus subjacent bàsic associat al tipus de retorn de la funció
                DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(df->getTipusRetorn());

                if(dt->getTSB() != ret.tsb){
                    // error tipus incompatibles
                    driver->error("valor de retorn incompatible (tsb)");
                }           
            }else{
                // comprovació forta de tipus
                if(ret.tipus != df->getTipusRetorn()){
                    // error tipus incompatibles
                    driver->error( error_tipus_no_compatibles(ret.tipus, df->getTipusRetorn() ) );
                }
            }
        }
    }else{
        // error (crític)
        driver->error("la funció ha de tenir un o més return");
    }

    // variables locals de la funció
    driver->ts.surtirBloc();

    // representar a l'arbre
    this->fills.push_back( driver->addTreeChild(this, "func") );
    this->fills.push_back(std::to_string(cap.getNodeId()));
    this->fills.push_back(std::to_string(bloc.getNodeId()));
    this->fills.push_back( driver->addTreeChild(this, "end " + nom + ";") );
    Simbol::toDotFile(driver);
}