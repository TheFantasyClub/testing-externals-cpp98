CC           = gcc
CPP          = gcc
CFLAGS       = -g -Wall -pedantic -std=c99
CPPFLAGS     = -g -Wall -pedantic -std=gnu++98
CDEF         =
LOADOPTS     =

LINKER       = ar
LINKER_ARGS  = rcs

BINFOLDER    = bin/
OBJFOLDER    = obj/
SRCFOLDER    = src/
LIBFOLDER    = lib/
INCFOLDER    = include/
INC_BASIC    = -I./$(INC_DIR)
INC_SOURCE   = -I./$(SRC_DIR)
INC_ALL      = $(INC_BASIC) $(INC_SOURCE)
LIB_BASE     = -L./$(LIBFOLDER)

all: \
     create_directories \
     create_the_library \
     execute_test_external

BIN_NAME   = external_testing_example
BIN_FILES  = $(OBJ_DIR)main.o
LIBRARIES_IN_EXECUABLE = $(LIB_BASE) -ltesting

LIB_NAME   = libtesting.a
LIB_FILES  = $(OBJ_DIR)testing.o

$(BIN_NAME): $(BIN_FILES)
	$(CPP) $(CDEF) $^ -o $(BINFOLDER)$@ $(INC_ALL) $(LIBRARIES_IN_EXECUABLE)

$(LIB_NAME): $(LIB_FILES)
	$(LINKER) $(LINKER_ARGS) $< $(LIBFOLDER)$@

create_the_library: $(LIB_NAME)

execute_test_external: $(BIN_NAME)
	./$(BINFOLDER)$<

create_directories:
	if [ ! -d ./$(LIBFOLDER)  ]; then mkdir -p ./$(LIBFOLDER) ;fi
	if [ ! -d ./$(BINFOLDER)  ]; then mkdir -p ./$(BINFOLDER) ;fi
	if [ ! -d ./$(OBJFOLDER)  ]; then mkdir -p ./$(OBJFOLDER) ;fi

$(OBJFOLDER)%.o: $(SRCFOLDER)%.c
	$(CPP) $(CPPFLAGS) $(INC_ALL) -c $< -o $@

cleanobj:
	rm -f $(OBJ_DIR)*.o

clean:
	rm -rf $(OBJ_DIR)

allc: all \
     cleanobj

Debug: all

Release: all

default: all
