#ifndef _H_NODE
#define _H_NODE

#include <fstream>
using namespace std;

enum NodeType{
    PROGRAM,
    DECLLIST,
    DECL,
    VARDECL,
    VARDECLLIST,
    VARINIT,
    CONST,
    FUNCDECL,
    PROCDECL,
    ARGS,
    ARGLIST,
    ARGLIST2,
    BLOC,
    STATEMENT
};

class Node{
private:
    // indica el tipus del node
    NodeType type;

public:
    Node(NodeType type);
    ~Node();

    NodeType getType();

    // per representar l'arbre
    virtual void toDotFile(ofstream * file);
};

// Node Declaracio
class Node_Declaracio : public Node{
private:
    Node *declaracio;
public:
    Node_Declaracio();
    ~Node_Declaracio();
};

// Node Llista Declaracions
class Node_DeclarationList : public Node{
private:
    Node *declaracio;
    Node_DeclarationList *llista;
public:
    Node_DeclarationList();
    ~Node_DeclarationList();

    void setDeclaracio(Node_Declaracio *node);
    void setDeclaracions(Node_DeclarationList *node);
};

// Node Programa
class Node_Program : public Node {
private:
    Node_DeclarationList *declaracions;
public:
    Node_Program();
    ~Node_Program();

    void setDeclaracions(Node_DeclarationList *declaracions);
};



#endif