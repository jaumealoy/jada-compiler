#ifndef _H_DESCRIPCIO_SUBPROGRAMA
#define _H_DESCRIPCIO_SUBPROGRAMA

#include <string>

class DescripcioSubPrograma {
public:
    enum Tipus {
        PROCEDIMENT,
        FUNCIO
    };

private:
    // número de procediment o subprograma
    int np;
    DescripcioSubPrograma::Tipus tipus;

public:
    DescripcioSubPrograma(Tipus tipus){
        this->tipus = tipus;
    }

    ~DescripcioSubPrograma() {}
};


class DescripcioProcediment : public DescripcioSubPrograma {
public:
    DescripcioProcediment() : DescripcioSubPrograma(DescripcioSubPrograma::Tipus::PROCEDIMENT) {

    }

    ~DescripcioProcediment(){}
};


#endif