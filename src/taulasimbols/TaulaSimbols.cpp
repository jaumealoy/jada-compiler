#include "TaulaSimbols.h"

#include <iostream>
#include <fstream>

TaulaSimbols::TaulaSimbols(){
    // inicialitzar la taula
    this->buida();
}

TaulaSimbols::~TaulaSimbols(){}

void TaulaSimbols::buida(){
    // reiniciar la taula, no s'ha entrat dins cap bloc
    this->nivellProfunditat = 0;
    this->indexLliure = 0;
    this->darrerNivellProfunditat = 0;

    for(int i = 0; i < MAX_SIMBOLS; i++){
        // taula de dispersió
        this->td[i].id.clear();
        this->td[i].index = TaulaSimbols::NUL;

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

        // no hi ha cap registre incicialment
        this->nivellsProfunditat[i] = TaulaSimbols::NUL;
    }
}

void TaulaSimbols::posar(std::string id){
    this->posar(id, nullptr);
}

void TaulaSimbols::posar(std::string id, Descripcio *declaracio){
    this->posar(id, declaracio, false);
}

void TaulaSimbols::posar(std::string id, Descripcio *declaracio, bool protegit){
    // comprovar si ja existeix aquesta entrada
    int index = this->hash(id) % MAX_SIMBOLS;

    // inserció dins la taula de dispersió
    int tries = 0;
    int finalIndex = index;
    while(this->td[finalIndex].index != TaulaSimbols::NUL && this->td[finalIndex].id.compare(id)){
        tries++;
        finalIndex = (index + tries * tries) % MAX_SIMBOLS;
    }

    int descripcioIndex;
    
    if(this->td[finalIndex].index != TaulaSimbols::NUL){
        int tmp = this->td[finalIndex].index;

        // ja existeix una entrada amb aquest nom
        // determinar si s'ha de moure a la taula d'expansió
        if(this->nivellProfunditat == this->tDescripcio[this->td[finalIndex].index].nivellProfunditat 
                || this->tDescripcio[this->td[finalIndex].index].nivellProfunditat == TaulaSimbols::NUL){
            // error! aquest símbol ja està definit en aquest nivell
            // de profunditat
            throw NomExistent();
        }else{
            // moure el símbol a la taula d'expansió

            // la taula d'àmbit indica el darrer lloc on s'ha escrit a la taula
            // d'expansió
            int indexExpansio = ++this->tAmbit[this->nivellProfunditat];

            this->tExpansio[indexExpansio].original = tmp;
            this->tExpansio[indexExpansio].nivellProfunditat = this->tDescripcio[tmp].nivellProfunditat;
            this->tExpansio[indexExpansio].next = -1;
            this->tExpansio[indexExpansio].identificador = this->tDescripcio[tmp].identificador;
            this->tExpansio[indexExpansio].declaracio = this->tDescripcio[tmp].declaracio;
            this->tExpansio[indexExpansio].nextNP = TaulaSimbols::NUL; // l'element s'inserirà al final
            this->tExpansio[indexExpansio].primerNP = this->tDescripcio[tmp].primerNP;

            if(this->nivellsProfunditat[this->tDescripcio[tmp].nivellProfunditat] == tmp){
                // és la capçalera
                this->nivellsProfunditat[this->tDescripcio[tmp].nivellProfunditat] = this->tDescripcio[tmp].nextNP;
            }else{
                // no és la capçalera de la llista
                // la llista té 2 elements o més
                int z = this->nivellsProfunditat[this->tDescripcio[tmp].nivellProfunditat];
                while(this->tDescripcio[z].nextNP != tmp){
                    z = this->tDescripcio[z].nextNP;
                }

                this->tDescripcio[z].nextNP = this->tDescripcio[tmp].nextNP;
            }

            // actualitzar l'entrada de la taula de descripció
            this->tDescripcio[tmp].nivellProfunditat = this->nivellProfunditat;
            this->tDescripcio[tmp].declaracio = declaracio;

            descripcioIndex = tmp;
        }
    }else{
        // crear una nova entrada a la taula de descripció
        int indexDescripcio = this->indexLliure;
        this->indexLliure = this->tDescripcio[this->indexLliure].next;

        this->td[finalIndex].index = indexDescripcio;
        this->td[finalIndex].id = id;

        // omplir la informació
        this->tDescripcio[indexDescripcio].identificador = id;
        this->tDescripcio[indexDescripcio].declaracio = declaracio;
        this->tDescripcio[indexDescripcio].next = TaulaSimbols::NUL;
        this->tDescripcio[indexDescripcio].original = finalIndex;
        this->tDescripcio[indexDescripcio].primerNP = this->nivellProfunditat;

        if(protegit){
            this->tDescripcio[indexDescripcio].nivellProfunditat = TaulaSimbols::NUL;
        }else{
            this->tDescripcio[indexDescripcio].nivellProfunditat = this->nivellProfunditat;
        }

        descripcioIndex = indexDescripcio;
    }

    // inserir l'element a la llista del seu nivell de profunditat (al principi)
    this->tDescripcio[descripcioIndex].nextNP = this->nivellsProfunditat[this->nivellProfunditat];
    this->nivellsProfunditat[this->nivellProfunditat] = descripcioIndex;
}

void TaulaSimbols::entrarBloc(){
    // indicar que s'ha entrat a un bloc
    this->nivellProfunditat++;

    // s'acaba d'entrar a un nivell de profunditat, és impossible que hi hagi
    // registres d'aquest nivell
    this->nivellsProfunditat[this->nivellProfunditat] = TaulaSimbols::NUL;

    // i actualitzar l'entrada del nivell actual a la taula d'àmbit
    this->tAmbit[this->nivellProfunditat] = this->tAmbit[this->nivellProfunditat - 1];
}

void TaulaSimbols::surtirBloc(){
    if(this->nivellProfunditat == 0){
        // no s'ha entrat a cap bloc, és un error
        return;
    }

    // eliminar aquelles entrades que s'han creat en el nivell
    // de profunditat que s'està abandonant
    int i = this->nivellsProfunditat[this->nivellProfunditat];
    while(i != TaulaSimbols::NUL){
        int tmpi = i;

        if(this->tDescripcio[i].primerNP == this->nivellProfunditat){
            this->tDescripcio[i].next = this->indexLliure;
            this->indexLliure = i;
            this->td[this->tDescripcio[i].original].index = TaulaSimbols::NUL;
        }

        i = this->tDescripcio[i].nextNP;
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

        int indexHash = this->tDescripcio[ this->tExpansio[i].original ].original;
        this->tDescripcio[ this->tExpansio[i].original ] = this->tExpansio[i];
        this->tDescripcio[ this->tExpansio[i].original ].original = indexHash;

        // aquest element formava part d'una llista de profunditat, l'hem de tornar a inserir
        // al final de la llista actual del seu nivell de profunditat
        int k = this->nivellsProfunditat[ this->tExpansio[i].nivellProfunditat ];

        int prev = TaulaSimbols::NUL;
        while(k != TaulaSimbols::NUL){
            prev = k;
            k = this->tDescripcio[k].nextNP;
        }

        if(prev == TaulaSimbols::NUL){
            // inserció al principi de la llista actual
            this->nivellsProfunditat[ this->tExpansio[i].nivellProfunditat ] = this->tExpansio[i].original;
        }else{
            // inserció al final de la llista
            this->tDescripcio[prev].nextNP = this->tExpansio[i].original;
        }
    }

    // aquest nivell de profunditat deixa de ser vàlid
    this->nivellsProfunditat[this->nivellProfunditat] = TaulaSimbols::NUL;

    this->nivellProfunditat--;
}


Descripcio *TaulaSimbols::consulta(std::string id){
    int finalIndex = this->getIndex(id);

    if(finalIndex == TaulaSimbols::NUL){
        // no existeix aquest identificador a la taula de símbols
        throw NomNoExistent();
    }

    // s'ha trobat un nom vàlid, retornar la seva descripció
    return this->tDescripcio[finalIndex].declaracio;
}


void TaulaSimbols::print(){
    std::cout << "= TD ==================" << std::endl;
    std::cout << "Nivell actual: " << this->nivellProfunditat << std::endl;
    std::cout << "Nivell darrer: " << this->darrerNivellProfunditat << std::endl;
    for(int i = 0; i < this->indexLliure; i++){
        std::cout << "Index " << i << " - ID: " << this->tDescripcio[i].identificador << " - NP: " << this->tDescripcio[i].nivellProfunditat << std::endl;
    }
    std::cout << "= TE =================" << std::endl;
    for(int i = 0; i < 10; i++){
        if(this->tExpansio[i].nivellProfunditat == NUL) continue;

        std::cout << "Index " << i << " - ID: " << this->tExpansio[i].identificador << " - NP: " << this->tExpansio[i].nivellProfunditat << std::endl;
    }

    std::cout << "===================" << std::endl;
}

/**
 * Funció per obtenir l'índex d'un identificador a la taula de dispersió
 * 
 * returns = NUL si no es troba l'element
 *           valor >= 0 en cas d'exisitir l'element, entrada a la taula de descripció
 */
int TaulaSimbols::getIndex(std::string id){
    int index = TaulaSimbols::NUL;

    int tries = 0;
    int finalIndex = this->hash(id) % MAX_SIMBOLS;

    while(this->td[finalIndex].index != TaulaSimbols::NUL && this->td[finalIndex].id.compare(id)){
        tries++;
        finalIndex = (finalIndex + tries * tries) % MAX_SIMBOLS;
    }

    return this->td[finalIndex].index;
}


void TaulaSimbols::posarParam(std::string idSubprograma, std::string idParam, DescripcioArgument *arg){
    // suposar que idSubprograma és un subprograma existent a la taula de símbols
    // ja que si no ho és haurà estat filtrar a la rutina semàntica
    int indexSubPrograma = this->getIndex(idSubprograma);

    // els paràmetres s'insereixen al final de la llista enllaçada d'arguments
    int previ = TaulaSimbols::NUL, actual = TaulaSimbols::NUL;
    actual = this->tDescripcio[indexSubPrograma].next;

    while(actual != TaulaSimbols::NUL && this->tExpansio[actual].identificador != idParam){
        previ = actual;
        actual = this->tExpansio[actual].next;
    }
    
    if(actual != TaulaSimbols::NUL){
        // aquest paràmetre ja existeix a la funció
        // error: no hi pot haver dos paràmetres formals amb el mateix nom
        throw NomExistent();
    }else{
        // reservar un slot a la taula d'expansió
        // la taula d'àmbit apunta al darrer lloc escrit a la taula d'expansió
        int nouIndex = ++this->tAmbit[this->nivellProfunditat];

        // el paràmetre no existeix
        if(previ == TaulaSimbols::NUL){
            // inserció al prinicipi de la llista
            this->tDescripcio[indexSubPrograma].next = nouIndex;
        }else{
            // inserció al final de la llista (actual = NUL)
            this->tExpansio[previ].next = nouIndex;
        }

        this->tExpansio[nouIndex].identificador = idParam;
        this->tExpansio[nouIndex].declaracio = arg;

        // no s'ha de canviar de taula en fer un surtBloc
        this->tExpansio[nouIndex].nivellProfunditat = TaulaSimbols::NUL;
    }
}

/**
 * Afegeix una dimensió a un tipus array
 * Les dimensions formaran una llista enllaçada ordenades (la primera, serà la primera dimensió)
 * Nota: la inserció s'ha de fer amb ordre invers
 */
void TaulaSimbols::posarDimensio(std::string nomTipus, DescripcioDimensio *dim){
    // suposarem que nomTipus ja està inserit a la taula de símbols
    // perquè posarDimensio només es cridarà una vegada s'hagi inserit l'array
    int indexArray = this->getIndex(nomTipus);

    // reservar un espai a la taula d'expansió
    int nouIndex = ++this->tAmbit[this->nivellProfunditat];

    // guardar la descripció de la dimensió
    this->tExpansio[nouIndex].declaracio = dim;
    
    // i marcar que aquest element no s'ha de transllardar de taula
    this->tExpansio[nouIndex].nivellProfunditat = TaulaSimbols::NUL;

    // afegir el nou element al prinicipi de la llista (d'aquí l'ordre invers de la inserció) 
    this->tExpansio[nouIndex].next = this->tDescripcio[indexArray].next;
    this->tDescripcio[indexArray].next = nouIndex;
}

/**
 * Volca la taula de símbols a un fitxer de text amb un format
 * més o menys llegible
 */
void TaulaSimbols::dump(std::string filename){
    std::string tipusDescripcions[] = { 
        "Nul", "Constant", "Variable", "Tipus",
        "Funcio", "Procediment", "Argument", "Dimensió"
    };

    std::ofstream arxiu(filename, std::fstream::out);

    arxiu << "=========================" << std::endl;
    arxiu << " Nivell de profunditat actual: " << this->nivellProfunditat << std::endl;
    arxiu << "=========================" << std::endl << std::endl;

    // Recòrrer la taula de descripció fins al darrer element ocupat
    for(int i = 0; i < this->indexLliure; i++){
        Descripcio *d = this->tDescripcio[i].declaracio;

        arxiu << "Índex " << i << " --> ID: " << this->tDescripcio[i].identificador;
        arxiu << " - Tipus de descripció: " << tipusDescripcions[d->getTipus()];
        arxiu << " - NP: " << this->tDescripcio[i].nivellProfunditat << std::endl;

        if(d->getTipus() == Descripcio::Tipus::FUNCIO || d->getTipus() == Descripcio::Tipus::PROCEDIMENT){
            arxiu << "-----> Paràmetres: ";
            int j = this->tDescripcio[i].next;

            while(j != TaulaSimbols::NUL){
                arxiu << "(" << this->tExpansio[j].identificador << ", ";
                DescripcioArgument *da = (DescripcioArgument *) this->tExpansio[j].declaracio;
                arxiu << da->getNomTipusArgument() << ") ";
                j = this->tExpansio[j].next;
            }
            arxiu << std::endl;
        }else if(d->getTipus() == Descripcio::Tipus::TIPUS){
            DescripcioTipus *dt = (DescripcioTipus *) d;
            arxiu << "-----> TSB: " << dt->getTSB() << std::endl;

            if(dt->getTSB() == TipusSubjacentBasic::ARRAY){
                DescripcioTipusArray *da = (DescripcioTipusArray *) dt;
                arxiu << "-----> Tipus unitari " << da->getTipusElement() << std::endl;
                arxiu << "-----> Dimensions: ";

                int j = this->tDescripcio[i].next;
                while(j != TaulaSimbols::NUL){
                    DescripcioDimensio *dd = (DescripcioDimensio *) this->tExpansio[j].declaracio;
                    arxiu << dd->getDimensio() << " ";
                    j = this->tExpansio[j].next;
                }
                arxiu << std::endl;
            }
        }

        arxiu << std::endl;
    }
}


TaulaSimbols::Iterator TaulaSimbols::getParametres(){
    return Iterator(this, Descripcio::Tipus::ARGUMENT);
}

TaulaSimbols::Iterator TaulaSimbols::getDimensions(){
    return Iterator(this, Descripcio::Tipus::DIMENSIO);
}

// Iterador
TaulaSimbols::Iterator::Iterator(){
    this->tipus = Descripcio::Tipus::NUL;
    this->index = -1;
    this->current = nullptr;
    this->ts = nullptr;
}

TaulaSimbols::Iterator::Iterator(TaulaSimbols *ts, Descripcio::Tipus tipus){
    this->tipus = tipus;
    this->index = -1;
    this->current = nullptr;
    this->ts = ts;
}

TaulaSimbols::Iterator::~Iterator(){

}

void TaulaSimbols::Iterator::first(std::string id){
    int indexDescripcio = this->ts->getIndex(id);

    if(indexDescripcio != TaulaSimbols::NUL){
        // l'element existeix
        this->index = this->ts->tDescripcio[indexDescripcio].next;

        if(this->index != TaulaSimbols::NUL){
            this->current = this->ts->tExpansio[this->index].declaracio;

            if(this->current != nullptr && this->current->getTipus() != this->tipus){
                this->current = nullptr;
            }
        }
    } 
}

void TaulaSimbols::Iterator::next(){
    if(!this->valid()) return;

    this->index = this->ts->tExpansio[this->index].next;
    this->current = this->ts->tExpansio[this->index].declaracio;
}

Descripcio * TaulaSimbols::Iterator::get(){
    return this->current;
}

std::string TaulaSimbols::Iterator::getId(){
    return this->ts->tExpansio[this->index].identificador;
}

bool TaulaSimbols::Iterator::valid(){
    return this->current != nullptr;
}
