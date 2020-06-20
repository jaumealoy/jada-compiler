#include "Lexic.h"
#include "Syntax.tab.hpp"
#include "Driver.h"
#include "taulasimbols/TaulaSimbols.h"
#include <iostream>
#include <cstring>
#include <unistd.h>

using namespace std;

int main(int argc, char **argv){
	if(argc < 2){
		cerr << "Error: no s'ha introduït un fitxer d'entrada" << endl;
		return EXIT_FAILURE;
	}

	bool debugMode = false;
	std::string outputFile = "codi";
	for(int i = 0; i < argc; i++){
		if(strcmp("-debug", argv[i]) == 0){
			debugMode = true;
			break;
		}else if(strcmp("-o", argv[i]) == 0){
			if(i + 1 < argc){
				outputFile = std::string(argv[i + 1]);
			}
		}
	}

	std::cout << "Debug = " << debugMode << std::endl;

	// anàlisi lèxica, sintàctica i semàntica
	Driver myDriver(argv[1], debugMode, outputFile);
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
		myDriver.code.writeToFile();

		// representació en assemblador
		myDriver.code.generateAssembly();
		
		string objectFile = outputFile + ".o";
		string assemblyFile = outputFile + ".s";

		// assemblar i linkear el programa
		/*if(execvp("as", { assemblyFile, string("-o"), objectFile }) == 0){
			// 
		}*/

		cout << "Compilació exitosa" << endl;
	}

	myDriver.ts.dump("ts.txt");
	
	return EXIT_SUCCESS;
}