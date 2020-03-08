SOURCES_DIR = taulasimbols
SIMBOLS_DIR = simbols
UTILS_DIR = utils
CODE_DIR = code

SOURCES = $(wildcard $(SOURCES_DIR)/*.cpp) $(wildcard $(SIMBOLS_DIR)/*.cpp) $(wildcard $(UTILS_DIR)/*.cpp) $(wildcard $(CODE_DIR)/*.cpp) $(wildcard $(CODE_DIR)/instructions/*.cpp)  Errors.cpp main.cpp  Lexic.cpp Syntax.tab.cpp Driver.cpp
HEADERS =  Driver.h Syntax.tab.hpp Lexic.h $(wildcard $(SOURCES_DIR)/*.h) $(wildcard $(UTILS_DIR)/*.h) $(wildcard $(CODE_DIR)/*.h) $(wildcard $(CODE_DIR)/*.hpp) $(wildcard $(CODE_DIR)/instructions/*.h) Errors.h location.hh Token.h $(wildcard $(SIMBOLS_DIR)/*.h)

# Object files to either reference or create                          
OBJECTS = $(SOURCES:.cpp=.o) 
# The executable file that will be created at the end                 
EXEC = jada                                                      
# The flags to use for compilation                                    
FLAGS = -Wall -g -Wextra                                                    
# The code compiler to use for compilation                            
CC = g++                                                    

# Perform action on all object files (May or may not exist)           
all: $(OBJECTS)                                                       
		$(CC) $(FLAGS) -o ../bin/$(EXEC) $(HEADERS) $(OBJECTS)

.PHONY: clean
clean: 
	rm -f $(OBJECTS) *.o

flex:
	flex -+ -o Lexic.cpp < Lexic.l #--trace -v

bison:
	bison -dv Syntax.ypp