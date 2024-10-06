#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "reader.h"
#include "types.h"

int main() {
  readData("timezone-2020.data");
  printData();
  printEntry(get("Buffalo"));
  printEntry(get("Uppsala"));
  struct timeZoneData * p = get("Santiago");
  printf("DST end date for %s is %d\n",p->loc, p->DST_end_date);
  printEntry(get("Montreal"));
}
