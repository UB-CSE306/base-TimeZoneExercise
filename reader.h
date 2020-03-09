#ifndef READER_H
#define READER_H

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "types.h"

void printEntry(struct timeZoneData * p);
void printData();
struct timeZoneData * get(char * loc);
void readData(char * filename);

#endif
