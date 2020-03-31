#ifndef _H_CODE_TABLE
#define _H_CODE_TABLE

#include <iostream>
#include <exception>

template <class T, int elements>
class Table{
private:
	T *data;
	int lastIndex;

public:
	class StorageError : public std::exception {};

	Table(){
		// fa referència al darrer element ocupat
		this->lastIndex = -1;
		this->data = new T[elements];
	}

	~Table(){
		for(int i = 0; i <= this->lastIndex; i++){
			if(this->data[i] != nullptr) {
				delete this->data[i];
				this->data[i] = nullptr;
			}
		}

		//delete this->data;
	}

	/**
	 * Afegeix un element a la taula i retorna la
	 * posició on s'ha inserit
	 */
	T add(T value){
		if(this->lastIndex >= elements){
			throw new Table::StorageError();
		}

		this->data[++this->lastIndex] = value;

		return this->data[this->lastIndex];
	}

	/**
	 * Obté la informació d'un element guardat al a posició
	 * n-èsima
	 */
	T get(int idx){
		if(idx > this->lastIndex){

		}

		return this->data[idx];
	}

	/**
	 * Retorna el número d'elements ocupats a la taula
	 */
	int size() { 
		// lastIndex simbolitza el darrer element ocupat
		return this->lastIndex + 1;
	}
};

#endif