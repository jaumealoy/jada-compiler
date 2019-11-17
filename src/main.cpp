#include <iostream>
#include "Lexic.h"

using namespace std;

int main(int argc, char **argv){
    if(argc < 2){
        cerr << "Error: no s'ha introduït un fitxer d'entrada" << endl;
        return EXIT_FAILURE;
    }

    Lexic myLexic(argv[1]);

    TokenType tk;
    while((tk = myLexic.getToken()) != TokenType::TK_EOF){
        cout << "Token: " << tk << endl;
    }

    cout << "Fi" << endl;
    
    return EXIT_SUCCESS;
}