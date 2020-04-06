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

	// anàlisi lèxica, sintàctica i semàntica
	Driver myDriver(argv[1]);
	myDriver.parse();
	myDriver.closeFiles();

	if(myDriver.exitosa()){
		// si no s'han generat errors, es pot generar el codi
		// representació en codi intermedi
		ofstream codeOutput("codi.txt");
		myDriver.code.writeToFile(codeOutput);

		// representació en assemblador
		myDriver.code.generateAssembly();
		
		cout << "Compilació exitosa" << endl;
	}

	myDriver.ts.dump("ts.txt");
	
	return EXIT_SUCCESS;
}