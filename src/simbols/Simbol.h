#ifndef _H_SIMBOL
#define _H_SIMBOL

class Driver;

class Simbol {
private:
    // per representar l'arbre en .dot
    int nodeId; // identificador del node de l'arbre
    int parentId; // identificador del pare

protected:
    Driver *driver;

    // indica si és una derivació a lambda
    bool _empty;

public:
    static int totalSimbols;

    Simbol();
    Simbol(Driver *&driver){ this->driver = driver; }

    ~Simbol();

    // controla les derivacions a lambda
    void makeEmpty();
    bool isEmpty();

    void toDotFile(){};
};


#endif