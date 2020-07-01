# JADA Compiler

Per compilar:
1. Compila els arxius lèxics i sintàctics fent ús de make flex i make bison, respectivament.
2. Genera els arxius de les funcions del llenguatge fent ús de make aux
3. Compila el compilador fent ús de make dins el directori src. El programa executable es troba a la carpeta bin, molt important que la carpeta bin estigui creada.

# Dependències
- Bison 3.5
- Flex 2.6.1
- GNU Binutils

En cas que el compilador no pugui assemblar i vincular els arxius en assemblador directament:

Per generar els codis objectes de les funcions del llenguatge (les fonts es troben a src/assembly/):
> as jada_functions.s -o jada_functions.o

> as jada_memory.s -o jada_memory.o

I per vincular amb l'arxiu generat amb els codis objectes anteriors:
> as arxiu programa.s -o arxiu programa.o

> ld jada_memory.o jada_functions.o arxiu programa.o -o programa