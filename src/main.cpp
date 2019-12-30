#include <iostream>
#include "Lexic.h"
#include "Syntax.tab.hpp"
#include "Driver.h"

#include "taulasimbols/TaulaSimbols.h"

using namespace std;

int main(int argc, char **argv){
	if(argc < 2){
		cerr << "Error: no s'ha introduït un fitxer d'entrada" << endl;
		return EXIT_FAILURE;
	}

	Driver myDriver(argv[1]);
	myDriver.parse();
	myDriver.closeFiles();
	
	if(myDriver.exitosa()){
		cout << "Compilació exitosa" << endl;
	}

	myDriver.ts.dump("ts.txt");
	
	return EXIT_SUCCESS;
}