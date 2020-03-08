struct timeZoneData {
  char loc[40];
  int offset;
  int DST_observe;    
  int DST_start_date; 
  int DST_start_time; 
  int DST_end_date;   
  int DST_end_time;   
  struct timeZoneData * next;
};

