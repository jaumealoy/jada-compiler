/**
 * Programa auxiliar per convertir un arxiu de text en un array de bytes
 * de manera que es pugui incorporar com una constant en un altre projecte
 */
#define BUFFER_SIZE 4096

#include <iostream>
#include <fcntl.h>
#include <unistd.h>
#include <cstring>

int main(int argc, char **argv)
{
    if(argc < 4){
        std::cerr << "Ús: ./conversor <arxiu d'entrada> <arxiu de sortida> <nom variable>" << std::endl;
        return EXIT_FAILURE;
    }

    int inputFile = open(argv[1], O_RDONLY);
    int outputFile = open(argv[2], O_CREAT | O_TRUNC | O_WRONLY, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP);

    if(outputFile < 0){
        std::cerr << "No s'ha pogut escriure el fitxer de sortida" << std::endl;
        return EXIT_FAILURE;
    }
    
    // inicialitzar l'arxiu de sortida
    std::string tmp1 = "const char " + std::string(argv[3]) + "[] = {\n\t";
    int k = write(outputFile, tmp1.c_str(), tmp1.length());

    char buffer[BUFFER_SIZE];
    int byteCount = 0;
    int readBytes = 0;
    int totalBytes = 0;
    while((readBytes = read(inputFile, buffer, BUFFER_SIZE)) > 0){
        char aux[16];

        totalBytes += readBytes;

        for(int i = 0; i < readBytes; i++){
            sprintf(aux, "%d, ", buffer[i]);
            write(outputFile, aux, strlen(aux));

            byteCount++;
            if(byteCount >= 15){
                std::string tmp = "\n\t";
                write(outputFile, tmp.c_str(), tmp.length());

                byteCount = 0;
            }
        }
    }

    std::string tmp2 = "0 \n};\n";
    write(outputFile, tmp2.c_str(), tmp2.length());

    std::string tmp3 = "const unsigned int " + std::string(argv[3]) + "_size = " + std::to_string(totalBytes) + ";";
    write(outputFile, tmp3.c_str(), tmp3.length());

    close(outputFile);
    close(inputFile);

    return EXIT_SUCCESS;
}