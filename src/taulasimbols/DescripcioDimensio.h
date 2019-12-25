#ifndef _H_DESCRIPCIO_DIMENSIO
#define _H_DESCRIPCIO_DIMENSIO

#include "Descripcio.h"

class DescripcioDimensio : public Descripcio {
private:
    int dimensio;
public:
    DescripcioDimensio(int dimensio);
    ~DescripcioDimensio();

    int getDimensio();
};

#endif