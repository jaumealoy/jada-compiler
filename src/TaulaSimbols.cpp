#include "TaulaSimbols.h"

#include <iostream>

TaulaSimbols::TaulaSimbols(){
    // inicialitzar la taula
    this->buida();
}

TaulaSimbols::~TaulaSimbols(){

}

void TaulaSimbols::buida(){
    // reiniciar la taula, no s'ha entrat dins cap bloc
    this->nivellProfunditat = 0;
    this->indexLliure = 0;

    for(int i = 0; i < MAX_SIMBOLS; i++){
        // taula de dispersió
        this->td[i].id.clear();
        this->td[i].next = TaulaSimbols::NUL;

        // taules pròpies de la taula de símbols
        this->tDescripcio[i].next = i + 1;
        this->tDescripcio[i].identificador.clear();

        for(int j = 0; j < MAX_PROFUNDITAT; j++){
            this->tExpansio[j].next = TaulaSimbols::NUL;
            this->tExpansio[j].identificador.clear();
        }
    }

    // el darrer bloc apunta a NUL per indicar el final dels blocs lliures
    this->tDescripcio[MAX_SIMBOLS - 1].next = TaulaSimbols::NUL;

    for(int i = 0; i < MAX_PROFUNDITAT; i++){
        this->tAmbit[i] = TaulaSimbols::NUL;
    }
}

void TaulaSimbols::posar(char *id){

}

void TaulaSimbols::posar(std::string id){
    // TODO: què passa si la taula de símbols és plena? indexLliure = -1

    // comprovar si ja existeix aquesta entrada
    int index = this->hash(id) % MAX_SIMBOLS;

    // inserció dins la taula de dispersió
    int tries = 0;
    while(this->td[index + tries * tries].next != TaulaSimbols::NUL && this->td[index + tries * tries].id == id){
        tries++;
    }
    
    int finalIndex = index + tries * tries;
    std::cout << "Index: " << finalIndex << std::endl;


    if(this->td[finalIndex].next != TaulaSimbols::NUL){
        int tmp = this->td[finalIndex].index;

        // ja existeix una entrada amb aquest nom
        // determinar si s'ha de moure a la taula d'expansió
        if(this->nivellProfunditat == this->tDescripcio[this->td[finalIndex].index].nivellProfunditat){
            // error! aquest símbol ja està definit en aquest nivell
            // de profunditat
        }else{
            // moure el símbol a la taula d'expansió

            // la taula d'àmbit indica el darrer lloc on s'ha escrit a la taula
            // d'expansió
            int indexExpansio = ++this->tAmbit[this->nivellProfunditat];

            this->tExpansio[indexExpansio].original = tmp;
            this->tExpansio[indexExpansio].nivellProfunditat = this->tDescripcio[tmp].nivellProfunditat;
            this->tExpansio[indexExpansio].next = -1;
            this->tExpansio[indexExpansio].identificador = this->tDescripcio[tmp].identificador;
        }
    }else{
        // crear una nova entrada a la taula de descripció
        int indexDescripcio = this->indexLliure;
        this->indexLliure = this->tDescripcio[this->indexLliure].next;

        this->td[finalIndex].index = indexDescripcio;
        this->td[finalIndex].id = id;
        this->td[finalIndex].next = TaulaSimbols::NUL;

        // omplir la informació
        this->tDescripcio[indexDescripcio].identificador = id;
        this->tDescripcio[indexDescripcio].next = TaulaSimbols::NUL;
    }

}

void TaulaSimbols::entrarBloc(){
    // indicar que s'ha entrat a un bloc
    this->nivellProfunditat++;
}

void TaulaSimbols::surtirBloc(){
    if(this->nivellProfunditat == 0){
        // no s'ha entrat a cap bloc, és un error
        // throw
    }

    // copiar tots els valors de la taula d'expansió a la taula de descripció
    // hem de tenir en compte que el punter de la taula d'àmbit indica el
    // el darrer valor escrit a la taula d'expansió
    for(int i = this->tAmbit[this->nivellProfunditat]; 
        i > this->tAmbit[this->nivellProfunditat - 1]; i--){
        
        if(this->tExpansio[i].nivellProfunditat == TaulaSimbols::NUL){
            // és un valor que no s'ha de copiar (forma part d'una llista)
            continue;
        }

        this->tDescripcio[ this->tExpansio[i].original ] = this->tExpansio[i];
    }
}

void TaulaSimbols::print(){
    int index = 0;

    while(true){
        std::cout << "ID: " << this->tDescripcio[index].identificador << std::endl;

        if(this->tDescripcio[index].next == TaulaSimbols::NUL){
            break;
        }

        index++;
    }
}