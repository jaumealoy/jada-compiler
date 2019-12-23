#include "SimbolFuncDecl.h"
#include "../Driver.h"

SimbolFuncDecl::SimbolFuncDecl() : Simbol() {}
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

        // 2. És possible que el valor de retorn sigui anònim (constant, resultat)
        if(bloc.getTipusReturn().empty()){
            // no es té un tipus concret
            // comprovar si els tipus subjacents són compatibles (del mateix tipus)
            // 2.1 Obtenir el tipus subjacent bàsic associat al tipus de retorn de la funció
            DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(df->getTipusRetorn());

            // TODO: revisar implementació dels TSB. S'hauria d'afegir un enumerat dels diferents TSB?
            /*if(dt->getTSB() != bloc.getTSBReturn()){
                // error tipus incompatibles
                driver->error("valor de retorn incompatible (tsb)");
            }*/           
        }else{
            // comprovació forta de tipus
            if(bloc.getTipusReturn() != df->getTipusRetorn()){
                // error tipus incompatibles
                driver->error("valor de retorn incompatible");
            }
        }
    }else{
        // error (crític)
        driver->error("la funció ha de tenir un o més return");
    }
}