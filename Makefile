#
# Makefile
#

CC   ?= gcc
CPP  ?= cpp
CXX  ?= g++
LD   ?= ld


CSTD   := gnu11
CXXSTD := gnu++14
OPTLVL := fast
DBGLVL := 0


CFLAGS := -std=$(CSTD) -O$(OPTLVL) -g$(DBGLVL) -Wall -pthread -I.
LDLIBS := -lm -pthread

OBJS := acarsserv.o \
	dbmgn.o \
	cJSON.o

acarsserv:	$(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ -lsqlite3

cJSON.o:	cJSON.c cJSON.h

acarsserv.o:	acarsserv.c acarsserv.h

dbmgm.o:	dbmgm.c acarsserv.h

clean:
	@\rm -f *.o acarsserv
