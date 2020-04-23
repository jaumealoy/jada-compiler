#include "TipusSubjacentBasic.h"

/**
 * Retorna la mida d'un TSB en bytes
 */
int TSB::sizeOf(TipusSubjacentBasic tsb){
	int size = 0;

	switch (tsb) {
		case TipusSubjacentBasic::BOOLEAN:
			size = sizeof(bool);
			break;

		case TipusSubjacentBasic::INT:
			size = sizeof(int);
			break;

		case TipusSubjacentBasic::CHAR:
			size = sizeof(char);
			break;

		case TipusSubjacentBasic::POINTER:
		case TipusSubjacentBasic::ARRAY:
			size = 8; // mida d'una adreça
			break;
	}

	return size;
}