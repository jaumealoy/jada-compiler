#ifndef _H_UTIL_SET
#define _H_UTIL_SET

#include "Domain.hpp"
#include <iterator>
#include <exception>
#include <memory>
#include <vector>
#include <iostream>

template <class E>
class Set {
private:
	// el número d'elements del domini
	int numElements;
	int numBytes;

	// domini del conjunt
	std::shared_ptr<Domain<E>> domini;
	std::vector<unsigned char> data;

public:
	Set() : domini(std::make_shared<Domain<E>>()), numBytes(0), data() {
	}

	Set(std::shared_ptr<Domain<E>> domini) : data() {
		// crear el conjunt 
		this->domini = domini;
		int nbytes = (domini->getSize() / (sizeof(unsigned char) * 8)) + 1;
		this->numBytes = nbytes;
		this->numElements = domini->getSize();

		for(int i = 0; i < nbytes; i++){
			this->data.push_back(0);
		}
	}

	~Set(){}

	/**
	 * Comprova si un element del domini es troba dins el conjunt
	 */
	bool contains(E* element){
		int elementId = this->domini->getElementId(element);
		
		if(elementId < 0){
			// l'element no és del domini
			throw new std::domain_error("element inexistent");
			return false;
		}

		// calcular a quin bytes es troba l'element
		int nbytes = elementId / (sizeof(unsigned char) * 8);

		// i dins aquest byte quin element és
		int nbit = elementId % (sizeof(unsigned char) * 8);

		unsigned char mask = 1 << (7 - nbit);

		return (this->data[nbytes] & mask) > 0;
	};

	/**
	 * Posa un element del domini dins el conjunt
	 */
	void put(E* element){
		int elementId = this->domini->getElementId(element);
		
		if(elementId < 0){
			// l'element no és del domini
			throw new std::domain_error("element inexistent");
			return;
		}

		// calcular a quin bytes es troba l'element
		int nbytes = elementId / (sizeof(unsigned char) * 8);

		// i dins aquest byte quin element és
		int nbit = elementId % (sizeof(unsigned char) * 8);

		unsigned char mask = 1 << (7 - nbit);

		this->data[nbytes] = this->data[nbytes] | mask;
	};

	/**
	 * Elimina un element del domini del conjunt
	 */
	void remove(E* element){
		int elementId = this->domini->getElementId(element);
		
		if(elementId < 0){
			// l'element no és del domini
			throw new std::domain_error("element inexistent");
			return;
		}

		// calcular a quin bytes es troba l'element
		int nbytes = elementId / (sizeof(unsigned char) * 8);

		// i dins aquest byte quin element és
		int nbit = elementId % (sizeof(unsigned char) * 8);

		unsigned char mask = ~(1 << (7 - nbit));
		this->data[nbytes] = this->data[nbytes] & mask;
	}

	/**
	 * Afegeix al conjunt tots els elements
	 */
	void putAll(){
		for(int i = 0; i < this->numBytes; i++){
			this->data[i] = 0xFF;
		}
	}

	/**
	 * Elimina tots els elements del conjunt
	 */
	void removeAll(){
		for(int i = 0; i < this->numBytes; i++){
			this->data[i] = 0;
		}
	}

	/**
	 * Unió de conjunts
	 * A + B
	 */
	void add(const Set<E> &b){
		if(this->domini != b.domini){
			throw new std::domain_error("dominis incompatibles");
		}

		for(int i = 0; i < this->data.size(); i++){
			this->data[i] = this->data[i] | b.data[i];
		}
	}

	/**
	 * Diferència de conjunts
	 * A -= rhs
	 */
	void difference(const Set<E> &b){
		if(this->domini != b.domini){
			throw new std::domain_error("dominis incompatibles");
		}

		for(int i = 0; i < this->numBytes; i++){
			this->data[i] = this->data[i] & (~b.data[i]);
		}	
	}

	/**
	 * Intersecció de conjunts
	 * A &= rhs <==> A & rhs
	 */
	void intersection(const Set<E> &b){
		if(this->domini != b.domini){
			throw new std::domain_error("dominis incompatibles");
		}

		for(int i = 0; i < this->numBytes; i++){
			this->data[i] = this->data[i] & b.data[i];
		}	
	}


	/**
	 * Compara si dos conjunts són iguals
	 */
	friend bool operator==(const Set<E> &lhs, const Set<E> &rhs){
		if(lhs.domini != rhs.domini){
			return false;
		}
		
		bool iguals = true;
		for(int i = 0; iguals && i < lhs.numBytes; i++){
			iguals = lhs.data[i] == rhs.data[i];
		}

		return iguals;
	}

	friend bool operator!=(const Set<E> &lhs, const Set<E> &rhs){
		return !(lhs == rhs);
	}

	// https://gist.github.com/jeetsukumaran/307264
	class iterator {
	private:
		// element actual
		int currentElement;
		Set<E> &conjunt;

	public:
		typedef iterator self_type;

		iterator(int numElement, Set<E> &dades) : conjunt(dades) { this->currentElement = numElement; }

		E* operator*() { return conjunt.domini->getElementById(this->currentElement); }

		self_type operator++(int junk){ 
			this->currentElement = conjunt.getNextElementId(this->currentElement + 1);
			return iterator(conjunt.getNextElementId(this->currentElement), conjunt);
		}

		void reset(){ this->currentElement = conjunt.getNextElementId(0); }

		bool operator<(const self_type& rhs) { return this->currentElement < rhs.currentElement; }
		bool operator==(const self_type& rhs) { return this->currentElement == rhs.currentElement; }
        bool operator!=(const self_type& rhs) { return this->currentElement != rhs.currentElement; }
	};

	iterator begin(){
		return iterator(this->getNextElementId(0), *this);
	}

	iterator end(){
		return iterator(this->numElements, *this);
	}

private:

	/**
	 * Retorna el següent element del conjunt a partir d'un element
	 * @param id número d'element inclòs
	 */
	int getNextElementId(int id){
		int numElement = id;

		int nbyte = id / (sizeof(unsigned char) * 8);
		int nbit = id % (sizeof(unsigned char) * 8);

		bool trobat = false;
		while(!trobat && nbyte < this->data.size()){
			if(this->data[nbyte] != 0){
				// dins aquest byte hi ha qualque element
				while(!trobat && nbit < 8){
					unsigned char mask = 1 << (7 - nbit);
					trobat = (this->data[nbyte] & mask) > 0;
					nbit++;
				}

				if(trobat){
					nbit--;	
					break;
				}
			}

			// passar al següent byte
			nbyte = nbyte + 1;
			nbit = 0;
		}

		if(trobat){
			numElement = nbyte * 8 + nbit;
		}else{
			numElement = this->numElements;
		}

		return numElement;
	}

};

#endif