

BIN=main
OUTDIR=build/
SRCDIR=src/
INCDIR=include/


CC=/usr/bin/g++
CFLAGS=-I $(SRCDIR) -I $(INCDIR)
LDFLAGS=


SOURCES= \
	$(shell find -name '*.cpp' -type f -printf '%f ')
#	$(BIN).cpp \
#	$(notdir $(wildcard $(SRCDIR)*.cpp))

OBJS=$(SOURCES:.cpp=.o)


%.o: $(SRCDIR)%.cpp
	$(CC) $(LDFLAGS) $(CFLAGS) -c $< -o $(OUTDIR)$@

%.o: %.cpp
	$(CC) $(LDFLAGS) $(CFLAGS) -c $< -o $(OUTDIR)$@

$(BIN): $(OBJS)
	$(CC) $(LDFLAGS) $(CFLAGS) -o $(BIN) $(OUTDIR)*.o

clean:
	-rm $(OUTDIR)*.o
	-rm $(BIN)
