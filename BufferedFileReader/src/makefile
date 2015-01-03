#Executable
EXECUTABLE=bufferedFileReader

#Sources
SOURCES=main.m BufferedFileReader.m

#Objects
OBJECTS=$(SOURCES:.m=.o)

#compiler
CC=gcc

#CFLAGS
CFLAGS=-c -Wall

#Objective-c specific flags
OBJCFLAGS=`gnustep-config --objc-flags`

#Objective-c specific flags
MACOBJCFLAGS=-framework Foundation

#GNUstep dependencies
GNUSTEPDEPS=`gnustep-config --base-libs`

#Common flags
COMMONFLAGS=$(OBJCFLAGS) $(GNUSTEPDEPS)


#Targets

#Linux Target
linux: all

#Mac Target
mac: COMMONFLAGS=$(MACOBJCFLAGS)
mac: all

#Windows Target
windows: all

#All Target
all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) $(COMMONFLAGS) -o $@

%.o: %.m
	$(CC) $(CFLAGS) $(COMMONFLAGS) $< -o $@

clean: 
	rm -rf *.o *.d $(EXECUTABLE)
