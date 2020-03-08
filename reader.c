#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "types.h"

FILE * inputFile;

struct timeZoneData * DATA;

void printEntry(struct timeZoneData * p) {
  if (p==NULL) {
    printf("(null)\n");
  }
  else {
    printf("Location: %-10s, UTC offset: %5d, DST observe: %1d, DST start date: %4d, DST start time: %4d,DST end date: %4d, DST end time: %4d\n",
	   p->loc,
	   p->offset,
	   p->DST_observe,    
	   p->DST_start_date, 
	   p->DST_start_time, 
	   p->DST_end_date,   
	   p->DST_end_time);
  }
}

void printData() {
  for (struct timeZoneData * p = DATA; p != NULL; p = p->next) {
    printEntry(p);
  }
}

struct timeZoneData * get(char * loc) {
  for (struct timeZoneData * p = DATA; p != NULL; p = p->next) {
    if (strcmp(p->loc,loc)==0) {
      return p;
    }
  }
  return NULL;
}

void readData(char * filename) {
  DATA = NULL;
  struct timeZoneData * temp;
  inputFile = fopen(filename, "r");
  while (1) {
    temp = malloc(sizeof(*temp));
    if ( fscanf(inputFile, "%s %d %d %d %d %d %d\n",
    		temp->loc,
    		&(temp->offset),
    		&(temp->DST_observe),
    		&(temp->DST_start_date),
    		&(temp->DST_start_time),
    		&(temp->DST_end_date),
		&(temp->DST_end_time)) != EOF) {
      temp->next = DATA;
      DATA = temp;
    }
    else {
      free(temp);
      break;
    }
  }
  fclose(inputFile);
}


int main() {
  readData("timezone-2020.data");
  printData();
  printEntry(get("Buffalo"));
  printEntry(get("Uppsala"));
  struct timeZoneData * p = get("Santiago");
  printf("DST end date for %s is %d\n",p->loc, p->DST_end_date);
  printEntry(get("Montreal"));
}
