

# Default compiler and compiler flags
CXX=g++
CC=gcc

# Default flags for all compilers
O_FLAGS=-Wall -Werror -Wextra -pedantic -O3
# Debugging flags
#O_FLAGS=-Wall -Werror -Wextra -pedantic -g2 -Og
CXX_FLAGS=$(O_FLAGS) -std=c++11
CC_FLAGS=$(O_FLAGS) -std=c99


# Binaries, object files, libraries and stuff
LIBS=
INCLUDE=
OBJS=
BINS=geoJson


# Default generic instructions
default:	all
all:	$(OBJS) $(BINS)
clean:	
	rm -f *.o
# Object files
%.o:	%.cpp %.hpp
	$(CXX) $(CXX_FLAGS) -c -o $@ $< $(INCLUDE) $(LIBS)
	
geoJson:    geoJson.cpp
	$(CXX) $(CXX_FLAGS) -march=native -o $@ $< $(INCLUDE) $(LIBS)
	
install:    geoJson
	install geoJson /usr/local/bin

