#include "Lexic.h"
#include "Syntax.tab.hpp"
#include "Driver.h"
#include "taulasimbols/TaulaSimbols.h"
#include <iostream>
#include <cstring>

using namespace std;

int main(int argc, char **argv){
	if(argc < 2){
		cerr << "Error: no s'ha introduït un fitxer d'entrada" << endl;
		return EXIT_FAILURE;
	}

	bool debugMode = false;
	for(int i = 0; i < argc; i++){
		if(strcmp("-debug", argv[i]) == 0){
			debugMode = true;
			break;
		}
	}

	std::cout << "Debug = " << debugMode << std::endl;

	// anàlisi lèxica, sintàctica i semàntica
	Driver myDriver(argv[1], debugMode);
	myDriver.parse();
	myDriver.closeFiles();

	if(myDriver.exitosa()){
		if(!debugMode){
			// aplicar optimitzacions
			std::cout << "Aplicant optimitzacions" << std::endl;
			myDriver.code.optimize();
		}

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