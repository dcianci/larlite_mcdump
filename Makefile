CC=g++
CFLAGS=-g
INCFLAGS =-I.
INCFLAGS+=$(shell root-config --cflags)
INCFLAGS+=$(shell larlite-config --includes)
INCFLAGS+=-I$(LARLITE_USERDEVDIR)

LDFLAGS =-L.
LDFLAGS+=$(shell root-config --libs)
LDFLAGS+=$(shell larlite-config --libs)
LDFLAGS+=-lRecoTool_ShowerRecoApp

SOURCES=run_MCDump.cxx
OBJECTS=$(SOURCES:.cxx=.o)
EXECUTABLE=run_MCDump

all: $(OBJECTS) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) -o $@ $(OBJECTS) $(LDFLAGS)

$(OBJECTS): $(SOURCES)
	$(CC) $(CFLAGS) $(INCFLAGS) -c $< -o $@

clean:
	rm *.o run_MCDump run_MCDump.o
