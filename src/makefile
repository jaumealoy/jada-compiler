SOURCES = main.cpp Lexic.cpp
HEADERS = Lexic.h Token.h

# Object files to either reference or create                          
OBJECTS = $(SOURCES:.cpp=.o) 
# The executable file that will be created at the end                 
EXEC = jada                                                      
# The flags to use for compilation                                    
FLAGS = -Wall                                                         
# The code compiler to use for compilation                            
CC = g++                                                    

# Perform action on all object files (May or may not exist)           
all: $(OBJECTS)                                                       
		$(CC) $(FLAGS) -o ../bin/$(EXEC) $(HEADERS) $(OBJECTS)

.PHONY: clean
clean: 
	rm -f $(OBJECTS) *.o