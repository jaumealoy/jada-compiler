#ifndef _H_DESCRIPCIOVAR
#define _H_DESCRIPCIOVAR

#include "Descripcio.h"
#include <string>
#include "../code/Variable.h"

class DescripcioVariable : public Descripcio {
private:
    std::string nomTipus;
    Descripcio::Tipus tipus;

    // variable per la generació de codi
	Variable variable;

public:
    DescripcioVariable(std::string tipus);
    ~DescripcioVariable();

    void setNomTipus(std::string tipus);
    std::string getNomTipus();

	void setVariable(Variable var);
	Variable getVariable();
};

#endif