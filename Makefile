OBJECTS = time.o reader.o

# OS identification from: https://stackoverflow.com/questions/714100/os-detecting-makefile
OS := $(shell uname -s)

ifeq ($(OS), Darwin) 
  INCLUDE_PATH := /opt/homebrew/include
  LIB_PATH := /opt/homebrew/lib/
  CC = gcc-12
endif
ifeq ($(OS), Linux) 
  INCLUDE_PATH := /util/criterion/include
  LIB_PATH := /util/criterion/lib/x86_64-linux-gnu
  CC = gcc
endif

CFLAGS = -g -Wall -O0 -std=c11
TESTING_FLAGS =  -fprofile-arcs -ftest-coverage


# Rules for making object files

time.o: time.c time.h types.h
	$(CC) $(CFLAGS) -c $<

reader.o: reader.c reader.h types.h 
	$(CC) $(CFLAGS) -c $<

main.o: main.c types.h reader.h
	$(CC) $(CFLAGS) -c $<

tests.o: tests.c types.h reader.h
	$(CC) $(CFLAGS) -I $(INCLUDE_PATH) -c $<


# Rules for executables

main: main.o $(OBJECTS)
	$(CC) $(CFLAGS) $^ -o $@

tests: tests.o $(OBJECTS) 
	$(CC) $(CFLAGS) $(TESTING_FLAGS) -L $(LIB_PATH) -I $(INCLUDE_PATH) $^ -o $@ -lcriterion -lgcov


# Other rules

.PHONY: clean info
clean:
	rm -rf *~ *.o *.dSYM main tests *.xml *.gc??

info:
	@echo "User-targets:"
	@echo "\ttests - the executable for the Criterion tests"
	@echo "\tmain - the executable for code in main.c"
	@echo "\tclean - remove Emacs autosave files and files generated by the compiler"
	@echo "\tinfo - print this message"
