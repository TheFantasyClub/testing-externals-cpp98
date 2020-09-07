CC           = gcc
CPP          = gcc
CFLAGS       = -g -Wall -pedantic -std=c99
CPPFLAGS     = -g -Wall -pedantic -std=gnu++98
CDEF         =
LOADOPTS     =
BINFOLDER    = bin/
OBJFOLDER    = obj/
SRCFOLDER    = src/
LIBFOLDER    = lib/
INCFOLDER    = include/
INC_BASIC    = -I./$(INC_DIR)
INC_SOURCE   = -I./$(SRC_DIR)
INC_ALL      = $(INC_BASIC) $(INC_SOURCE)

all: \
     create_directories \


create_directories:
	if [ ! -d ./$(LIBFOLDER)  ]; then mkdir -p ./$(LIBFOLDER) ;fi
	if [ ! -d ./$(BINFOLDER)  ]; then mkdir -p ./$(BINFOLDER) ;fi
	if [ ! -d ./$(OBJFOLDER)  ]; then mkdir -p ./$(OBJFOLDER) ;fi

$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	$(CPP) $(CPPFLAGS) $(INC_ALL) -c $< -o $@

cleanobj:
	# --- Clean all objects ---
	rm -f $(OBJ_DIR)*.o

clean:
	# --- Clean all objects ---
	rm -rf $(OBJ_DIR)

allc: all \
     cleanobj

Debug: all

Release: all

default: all
