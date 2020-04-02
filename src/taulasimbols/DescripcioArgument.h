#ifndef _H_DESCRIPCIOARG
#define _H_DESCRIPCIOARG

#include "Descripcio.h"
#include "../code/Variable.h"
#include <string>

class DescripcioArgument : public Descripcio {
public:
    enum Tipus {
        IN,
        IN_OUT,
        VALOR
    };

private:
    std::string nomTipus;
    DescripcioArgument::Tipus tipus;

	// variable associada al paràmetre
	Variable *var;

public:
	DescripcioArgument(std::string tipus, DescripcioArgument::Tipus tipusArg);
	~DescripcioArgument();

    void setTipusArgument(DescripcioArgument::Tipus argType);
    DescripcioArgument::Tipus getTipusArgument();

	// tipus (descripció de tipus)
	std::string getNomTipusArgument();

	void setVariable(Variable *var);
	Variable *getVariable();
};

#endif