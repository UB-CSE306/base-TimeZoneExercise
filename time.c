#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "types.h"
#include "reader.h"

int time_difference(char * A, char * B, int dateAtA, int timeAtA) {
  return 0;
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
