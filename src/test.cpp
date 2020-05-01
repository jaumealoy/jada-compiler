#include  <list>
#include <iostream>
#include <map>
#include <cassert>

#include "utils/Domain.hpp"
#include "utils/Set.hpp"

int main(){
    /*std::list<int> a;
	a.push_back(5);
	a.push_back(4);
	a.push_back(3);

	std::list<int> b = a;
	a.pop_back();

	std::cout << "A = " << a.size() << std::endl;
	std::cout << "B = " << b.size() << std::endl;

*/
	/*std::map<int, int> aMap;
	aMap[7] = 5;

	auto value =  aMap.find(7);
	if(value == aMap.end()){

	}else{
		std::cout << "A[7] = " << value->second << std::endl;
	}*/

	// proves de dominis i conjunts
	int elements[] = {5, 7, 8, 9, 9, 10, 1, 2, 3, 4, 5};
	std::list<int *> listElements;
	listElements.clear();
	
	for(int i = 0; i < 10; i++){
		listElements.push_back(&elements[i]);
	}

	std::shared_ptr<Domain<int>> domini = std::make_shared<Domain<int>>(listElements);
	Set<int> conjunt(domini);

	conjunt.put(&elements[1]);
	std::cout << "7 in conjunt = " << conjunt.contains(&elements[1]) << std::endl;
	std::cout << "5 in conjunt = " << conjunt.contains(&elements[0]) << std::endl;

	conjunt.put(&elements[2]);
	std::cout << "8 in conjunt = " << conjunt.contains(&elements[2]) << std::endl;
	std::cout << "9 in conjunt = " << conjunt.contains(&elements[3]) << std::endl;

	conjunt.remove(&elements[2]);

	std::cout << "7 in conjunt = " << conjunt.contains(&elements[1]) << std::endl;
	std::cout << "5 in conjunt = " << conjunt.contains(&elements[0]) << std::endl;
	std::cout << "8 in conjunt = " << conjunt.contains(&elements[2]) << std::endl;
	std::cout << "9 in conjunt = " << conjunt.contains(&elements[3]) << std::endl;



	Set<int> a(domini);
	Set<int> b(domini);

	a.put(&elements[0]);
	a.put(&elements[3]);
	a.put(&elements[7]);
	a.put(&elements[9]);
	b.put(&elements[3]);
//	b.put(&elements[9]);

	std::cout << "Hola" << std::endl;
	std::cout << "3 in b = " << a.contains(&elements[3]) << std::endl;

	std::cout << " A + B " << std::endl;

	//a.intersection(b);

	

	bool t = a != b;

	std::cout << "0 in conjunt = " << a.contains(&elements[0]) << std::endl;
	std::cout << "1 in conjunt = " << a.contains(&elements[1]) << std::endl;
	std::cout << "2 in conjunt = " << a.contains(&elements[2]) << std::endl;
	std::cout << "3 in conjunt = " << a.contains(&elements[3]) << std::endl;
	std::cout << "9 in conjunt = " << a.contains(&elements[9]) << std::endl;

	std::cout << "Primer element " << a.getNextElementId(0) << std::endl;

	assert(a.domini->getElementById(0) == &elements[0]);

	Set<int>::iterator itAux = a.begin();
	while(itAux != a.end()){
		std::cout << "Valor => " << **itAux << " dins conjunt A" << std::endl;
		itAux++;
	}


	b = a;
}