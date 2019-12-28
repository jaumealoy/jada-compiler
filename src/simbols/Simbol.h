#ifndef _H_SIMBOL
#define _H_SIMBOL

class Driver;
#include <string>
#include <vector>

class Simbol {
private:

protected:
    Driver *driver;

    // indica si és una derivació a lambda
    bool _empty;

    // per representar l'arbre en .dot
    std::string nomNode;
    std::vector<std::string> fills; // llista de fills
    int nodeId; // identificador del node de l'arbre

public:
    static int totalSimbols;

    Simbol();
    Simbol(std::string);
    Simbol(Driver *&driver){ this->driver = driver; }

    ~Simbol();

    void make(Driver *driver);

    // controla les derivacions a lambda
    void makeEmpty();
    bool isEmpty();

    virtual void toDotFile(Driver *driver);
    int getNodeId();
};


#endif