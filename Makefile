#
# Makefile
#

PRJ := acarsserv

CC   ?= gcc
CPP  ?= cpp
CXX  ?= g++
LD   ?= ld

RM      := rm
ECHO    := echo
MKDIR   := mkdir
INSTALL := install
TOUCH   := touch


CSTD   := gnu11
CXXSTD := gnu++14
OPTLVL := fast
DBGLVL := 0


INCDIRS := -I.
LIBS    := -lm
LIBS    += -lsqlite3


CFLAGS   := -std=$(CSTD) -O$(OPTLVL) -g$(DBGLVL) -Wall -pthread $(INCDIRS)
CXXFLAGS := -std=$(CXXSTD) -O$(OPTLVL) -g$(DBGLVL) -Wall -pthread $(INCDIRS)
LDLIBS   := $(LIBS) -pthread

OBJS := acarsserv.o \
		dbmgn.o \
		cJSON.o



$(PRJ):	$(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LIBS)


cJSON.o:		cJSON.c cJSON.h

acarsserv.o:	acarsserv.c acarsserv.h gitversion.h

dbmgm.o:		dbmgm.c acarsserv.h


.PHONY: gitversion.h

FORCE:

clean:
	$(RM) -f *.o
	$(RM) -f $(PRJ)


install:
	$(INSTALL) -m 755 $(PRJ) /usr/local/bin/


#
# Export the current git version, if the index file exists (else "0000....")
#
gitversion.h:
ifneq ("$(wildcard .git/index)","")
	echo "#ifndef GITVERSION_H_" > $@
	echo "#define GITVERSION_H_" >> $@
	echo "const char *program_version_gitversion = \"$(shell git rev-parse HEAD)\";" >> $@
	echo "#endif" >> $@
else
	echo "#ifndef GITVERSION_H_" > $@
	echo "#define GITVERSION_H_" >> $@
	echo "const char *program_version_gitversion = \"0000000000000000000000000000000000000000\";" >> $@
	echo "#endif" >> $@
endif
