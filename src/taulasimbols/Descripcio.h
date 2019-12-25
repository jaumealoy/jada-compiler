#ifndef _H_DECLARACIO
#define _H_DECLARACIO



class Descripcio {
public:
    enum Tipus {
        NUL,
        CONSTANT,
        VARIABLE,
        TIPUS,
        FUNCIO,
        PROCEDIMENT,
        ARGUMENT,
        DIMENSIO
    };

private:
    Tipus type;

public:
    Descripcio();
    Descripcio(Descripcio::Tipus type);
    virtual ~Descripcio();

    Descripcio::Tipus getTipus();
};

#endif