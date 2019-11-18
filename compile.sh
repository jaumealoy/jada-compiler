# Compila lèxic i sintàctic dins la carpeta src
flex -+ -o src/Lexic.cpp < src/Lexic.l
bison -d src/Syntax.ypp