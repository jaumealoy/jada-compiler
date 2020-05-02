#ifndef _H_UTILS_DOMAIN
#define _H_UTILS_DOMAIN

#include <map>
#include <list>
#include <vector>

template <class E>
class Domain {
private:
	// elements del domini
	int numElements;
	std::map<E*, int> elements;
	std::vector<E*> elementsReverse;

public: 
	Domain() : numElements(0) {}

	Domain(std::list<E*> elements) {
		this->numElements = 0;

		typename std::list<E*>::iterator it = elements.begin();
		while(it != elements.end()){
			this->elements[*it] = this->numElements++;
			this->elementsReverse.push_back(*it);
			it++;
		}
	};

	~Domain() {
	}

	/**
	 * Retorna l'identificador únic de cada element
	 */
	int getElementId(E *element){
		auto it = this->elements.find(element);
		
		if(it == elements.end()){
			// no s'ha trobat
			return -1;
		}

		return it->second;
	}

	/**
	 * Obtenir un element a partir del seu identificador
	 */
	E* getElementById(int id){
		if(id < 0 || id > this->numElements){
			return nullptr;
		}

		return this->elementsReverse[id];
	}

	/**
	 * Retorna el número d'elements del domini
	 */
	int getSize(){
		return this->numElements;
	}


	friend bool operator==(const Domain<E> &lhs, const Domain<E> &rhs){
		return lhs.numElements == rhs.numElements;
	}

	friend bool operator!=(const Domain<E> &lhs, const Domain<E> &rhs){
		return !(lhs == rhs);
	}

};

#endif