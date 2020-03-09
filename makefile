OBJECTS = time.o reader.o
EXECUTABLE = timeTests

# OS identification from: https://stackoverflow.com/questions/714100/os-detecting-makefile
OS := $(shell uname -s)

ifeq ($(OS), Darwin) 
  CUNIT_PATH_PREFIX = /usr/local/Cellar/cunit/2.1-3/
  CUNIT_DIRECTORY = cunit
endif
ifeq ($(OS), Linux) 
  CUNIT_PATH_PREFIX = /util/CUnit/
  CUNIT_DIRECTORY = CUnit/
endif

CC = gcc
CFLAGS = -g -Wall -O0 -fprofile-arcs -ftest-coverage 

time.o: time.c time.h 
	$(CC) $(CFLAGS) -c time.c

reader.o: reader.c reader.h 
	$(CC) $(CFLAGS) -c reader.c

tests: $(OBJECTS) timeTests.c
	$(CC) $(CFLAGS) -L $(CUNIT_PATH_PREFIX)lib  -I $(CUNIT_PATH_PREFIX)include/$(CUNIT_DIRECTORY) $(OBJECTS) timeTests.c -o $(EXECUTABLE) -lcunit -lgcov 

.PHONY: clean
clean:
	rm -rf *~ *.o *.dSYM $(EXECUTABLE) *.xml *.gc??
