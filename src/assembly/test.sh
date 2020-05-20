as test.s -o codi.out 
as jada_memory.s -o jada_memory.out 
as jada_functions.s -o jada_functions.out 
ld codi.out jada_memory.out jada_functions.out -o codi.exe
./codi.exe