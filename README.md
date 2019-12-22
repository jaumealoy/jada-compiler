# JADA Compiler

Per compilar:
1. Compila els arxius lèxics i sintàctics fent ús de 
make flex i make bison, respectivament.
2. Compila el compilador fent ús de make dins el directori src. El programa executable es troba a la carpeta bin

# Canvis gramàtica
```
cap -> contCap ) .
cap -> ID ( ) .
contCap -> ID ( Tipus ID .
contCap -> contCap , Tipus ID .
```



```
tipus -> id .
tipus -> array .
array -> contArray [ INT ] .
contArray -> id .
contArray -> contArray [ INT ] .
```