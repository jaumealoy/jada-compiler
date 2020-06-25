#include "Lexic.h"
#include "Syntax.tab.hpp"
#include "Driver.h"
#include "taulasimbols/TaulaSimbols.h"
#include <iostream>
#include <cstring>
#include <fcntl.h>
#include <unistd.h>

#include <sys/types.h>
#include <sys/wait.h>

#include "assembly/jada_functions.h"
#include "assembly/jada_memory.h"

using namespace std;

int run(char *filename, const char **argv);

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

	// anàlisi lèxica, sintàctica i semàntica
	Driver myDriver(argv[1], debugMode, outputFile);
	myDriver.parse();
	myDriver.closeFiles();

	if(myDriver.exitosa()){
		if(!debugMode){
			// aplicar optimitzacions
			myDriver.code.optimize();
		}

		// si no s'han generat errors, es pot generar el codi
		// representació en codi intermedi
		myDriver.code.writeToFile();

		// representació en assemblador
		myDriver.code.generateAssembly();

		myDriver.code.dump();
		
		string objectFile = outputFile + ".o";
		string assemblyFile = outputFile + ".s";

		string auxFilenames[] = {"jada_functions", "jada_memory"}; 
		string auxFilenames1[] = {"jada_functions.o", "jada_memory.o"}; 
		const char *auxFilesData[] = { jada_functions, jada_memory };
		unsigned int auxFilesSize[] = { jada_functions_size, jada_memory_size };

		// assemblar i linkear el programa
		const char **argv1 = new const char*[5];
		argv1[0] = string("as").c_str();
		argv1[1] = assemblyFile.c_str();
		argv1[2] = string("-o").c_str();
		argv1[3] = objectFile.c_str();
		argv1[4] = nullptr;

		int errors = 0;

		// generar el codi objecte del propi programa
		errors = run((char *) argv1[0], argv1) | errors; 
		delete[] argv1;

		// generar el codi objecte de les funcions auxiliars
		for(int i = 0; i < 2; i++){
			string aux = string(auxFilenames[i]) + ".s";
			int fd = open(aux.c_str(), O_CREAT | O_TRUNC| O_WRONLY, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP);
			write(fd, auxFilesData[i], auxFilesSize[i]);
			close(fd);

			const char **argv = new const char*[5];
			argv[0] = string("as").c_str();
			argv[1] = aux.c_str();
			argv[2] = string("-o").c_str();
			argv[3] = auxFilenames1[i].c_str();
			argv[4] = nullptr;

			errors = run((char *) argv[0], argv) | errors;
			delete[] argv;
		}

		// i finalment vincular els diferents codis objectes
		const char **argv2 = new const char*[7];
		argv2[0] = string("ld").c_str();
		argv2[1] = objectFile.c_str();
		argv2[2] = auxFilenames1[0].c_str();
		argv2[3] = auxFilenames1[1].c_str();
		argv2[4] = string("-o").c_str();
		argv2[5] = outputFile.c_str();
		argv2[6] = nullptr;

		// generar el codi objecte del propi programa
		errors = run((char *) argv2[0], argv2) | errors;
		delete[] argv2;

		// eliminar arxius creats
		errors = remove("jada_functions.s") | errors;
		errors = remove("jada_functions.o") | errors;
		errors = remove("jada_memory.s") | errors;
		errors = remove("jada_memory.o") | errors;

		if(errors){
			cout << "S'han produït errors durant l'assemblatge i vinculació." << endl;
		}else{
			cout << "Compilació exitosa (optimitzat = "<< !debugMode <<")" << endl;
			cout << "Generats executable ("<< outputFile <<"), codi intermedi ("<< outputFile <<".txt) i assemblador ("<< outputFile << ".s)" << std::endl;
		}

	}

	myDriver.ts.dump("ts.txt");
	
	return EXIT_SUCCESS;
}


/**
 * Executa un arxiu del sistema i espera a acabar
 */
int run(char *filename, const char **argv){
	int pid = fork();
	if(pid == 0){
		// procés fill
		execvp(filename, (char **) argv);
	}else if(pid < 0){
		exit(0);
	}else{
		int status = 0;
		waitpid(pid, &status, 0);
		return status;
	}
}
