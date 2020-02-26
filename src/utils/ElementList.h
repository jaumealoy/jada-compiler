#ifndef _H_ELEMENT_LIST
#define _H_ELEMENT_LIST
class ElementList{
private:
	int numElements; // màxim número d'elements de la llista
	unsigned int elementSize; // mida de cada un dels elements

	int lastElement = -1;

	char **data;
public:
	ElementList(int numElements, unsigned int elementSize);
	~ElementList();

	void add(void *ptr);
	void *get(int i);
};
#endif