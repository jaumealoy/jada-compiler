#pragma once
#include <string>

enum TATIPUS{
    SUMA,
    RESTA,
    AND,
    OR,
    NOT,
    NEG,
    IND_VALOR,
    IND_ASS,
    SKIP,
    GOTO,
    GT,
    GE,
    EQ,
    LT,
    LE,
    PMP,
    CALL,
    PARAMS,
    PARAMC,
    COPIA
};

class tresa{
private:

public:
    TATIPUS tipus;
    int op1, op2, op3;

    tresa(TATIPUS tipus, int op1, int op2, int op3);
    tresa();

    std::string toString();
};
