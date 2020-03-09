# TimeZoneExercise

To try out the code, compile with:

    gcc -g -std=c11 -Wall -o reader reader.c time.c

then run:

    ./reader

The main function is in reader.c

The data is in timezone_2020.data

A time zone offset of -4 hours is entered as -400.
A time zone offset of -4 hours and 30 minutes is entered as -450 (50/100th of an hour).
