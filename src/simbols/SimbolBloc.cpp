#include "SimbolBloc.h"
#include "../Driver.h"
#include "../code/instructions/MemoryInstruction.h"

SimbolBloc::SimbolBloc() : Simbol("Bloc") {}
SimbolBloc::~SimbolBloc() {}

void SimbolBloc::make(Driver *driver, SimbolStatementList list){
    // Propaga els returns i breaks al bloc actual
    this->propaga(list);

    // pintar a l'arbre
    this->fills.push_back(std::to_string(list.getNodeId()));
    Simbol::toDotFile(driver);

	// la següent instrucció d'aquest bloc no es coneix encara
	this->seg = list.getSeg();

    // alliberar tots aquells punters que deixen de ser visibles
    // és a dir, aquells que s'han creat dins aquest bloc
    std::list<Descripcio *> declaracionsActual = driver->ts.getBlockSymbols();
    std::list<Descripcio *>::iterator it = declaracionsActual.begin();
    while(it != declaracionsActual.end()){
        Descripcio *d = *it;
        if(d->getTipus() == Descripcio::Tipus::VARIABLE){
            DescripcioVariable *dv = (DescripcioVariable *) d;
            DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(dv->getNomTipus());
            if(dt->getTSB() == TipusSubjacentBasic::POINTER){
                driver->code.addInstruction(new MemoryInstruction(
                    dv->getVariable(),
                    MemoryInstruction::Type::DECREMENT
                ));
            }
        }else if(d->getTipus() == Descripcio::Tipus::CONSTANT){
            DescripcioConstant *dc = (DescripcioConstant *) d;
            DescripcioTipus *dt = (DescripcioTipus *) driver->ts.consulta(dc->getNomTipus());
            
            if(dt->getTSB() == TipusSubjacentBasic::POINTER){
                driver->code.addInstruction(new MemoryInstruction(
                    dc->getVariable(),
                    MemoryInstruction::Type::DECREMENT
                ));
            }
        }

        it++;
    }
}