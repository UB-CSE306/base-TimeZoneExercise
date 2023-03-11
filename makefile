OBJECTS = time.o reader.o
EXECUTABLE = timeTests

# OS identification from: https://stackoverflow.com/questions/714100/os-detecting-makefile
OS := $(shell uname -s)

ifeq ($(OS), Darwin) 
  INCLUDE_PATH := /opt/homebrew/Cellar/criterion/2.4.1_1/include
  LIB_PATH := /opt/homebrew/Cellar/criterion/2.4.1_1/lib
  CC = gcc-12
endif
ifeq ($(OS), Linux) 
  INCLUDE_PATH := /util/criterion/include
  LIB_PATH := /util/criterion/lib/x86_64-linux-gnu
  CC = gcc
endif

CFLAGS = -g -Wall -O0 -fprofile-arcs -ftest-coverage -std=c11

time.o: time.c time.h 
	$(CC) $(CFLAGS) -c time.c

reader.o: reader.c reader.h 
	$(CC) $(CFLAGS) -c reader.c

tests: $(OBJECTS) timeTests.c
	$(CC) $(CFLAGS) -L $(CUNIT_PATH_PREFIX)lib  -I $(CUNIT_PATH_PREFIX)include/$(CUNIT_DIRECTORY) $(OBJECTS) timeTests.c -o $(EXECUTABLE) -lcriterion -lgcov 

.PHONY: clean
clean:
	rm -rf *~ *.o *.dSYM $(EXECUTABLE) *.xml *.gc??
