#include <iostream>
#include "Lexic.h"
#include "Syntax.tab.hpp"
#include "Driver.h"

#include "TaulaSimbols.h"

using namespace std;

int main(int argc, char **argv){
	if(argc < 2){
		cerr << "Error: no s'ha introduït un fitxer d'entrada" << endl;
		return EXIT_FAILURE;
	}

	//Lexic myLexic(argv[1]);
	//yy::Syntax mySyntax(&myLexic);
	//Driver myDriver(argv[1]);

	//Node_Program *root = myDriver.parse();
	//ofstream fileSave("tree.dot");
	//root->toDotFile(fileSave, nullptr);

	TaulaSimbols ts;
	ts.posar(string("hola"));
	ts.print();

	ts.posar(string("hola2"));
	cout << "S'ha inserit" << endl;
	ts.print();
	cout << "Fi" << endl;
	
	return EXIT_SUCCESS;
}