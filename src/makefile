SOURCES_DIR = taulasimbols
SIMBOLS_DIR = simbols

SOURCES = $(wildcard $(SOURCES_DIR)/*.cpp) $(wildcard $(SIMBOLS_DIR)/*.cpp) Errors.cpp main.cpp  Lexic.cpp Syntax.tab.cpp Driver.cpp
HEADERS =  Driver.h Syntax.tab.hpp Lexic.h $(wildcard $(SOURCES_DIR)/*.h) strings/StringBuffer.cpp Errors.h location.hh Token.h  $(wildcard $(SIMBOLS_DIR)/*.h)

# Object files to either reference or create                          
OBJECTS = $(SOURCES:.cpp=.o) 
# The executable file that will be created at the end                 
EXEC = jada                                                      
# The flags to use for compilation                                    
FLAGS = -Wall -g                                                    
# The code compiler to use for compilation                            
CC = g++                                                    

# Perform action on all object files (May or may not exist)           
all: $(OBJECTS)                                                       
		$(CC) $(FLAGS) -o ../bin/$(EXEC) $(HEADERS) $(OBJECTS)

.PHONY: clean
clean: 
	rm -f $(OBJECTS) *.o

flex:
	flex -+ -o Lexic.cpp < Lexic.l

bison:
	bison -dv Syntax.ypp