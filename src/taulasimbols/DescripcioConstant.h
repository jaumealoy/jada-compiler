#ifndef _H_DESCRIPCIOCONST
#define _H_DESCRIPCIOCONST

#include "Descripcio.h"
#include "../utils/ValueContainer.h"
#include <memory>
#include <string>


class DescripcioConstant : public Descripcio {
public:

private:
    std::string nomTipus;
    Descripcio::Tipus tipus;

    int intValue;
    char charValue;
    bool boolValue;

	// contenedor genèric per guardar valors
	std::shared_ptr<ValueContainer> value;

public:
    DescripcioConstant(std::string tipus);
    ~DescripcioConstant();

    void setNomTipus(std::string tipus);
    std::string getNomTipus();
	
	std::shared_ptr<ValueContainer> getValue();
	void setValue(std::shared_ptr<ValueContainer> value);
};

#endif