#ifndef _H_DECLARACIO
#define _H_DECLARACIO

enum Tipus {
    NUL,
    CONSTANT,
    VARIABLE,
    TIPUS,
    FUNCIO,
    PROCEDIMENT,
    ARGUMENT,
};

class Descripcio {
private:
    Tipus type;

public:
    Descripcio();
    Descripcio(Tipus type);
    ~Descripcio();
};

#endif