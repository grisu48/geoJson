

# Default compiler and compiler flags
CXX=gcc

# Default flags for all compilers
O_FLAGS=-Wall -Werror -Wextra -pedantic -O3
# Debugging flags
#O_FLAGS=-Wall -Werror -Wextra -pedantic -g2 -Og
CXX_FLAGS=$(O_FLAGS) -std=c++11


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

test: 	geoJson
	./geoJson test.gpx 1>/dev/null

install:    geoJson
	install geoJson /usr/local/bin

release:	geoJson.cpp
	g++ -Wall -Werror -Wextra -pedantic -O3 -std=c++11 -march=x86-64 -m64 -static -o geoJson-amd64-static geoJson.cpp
	g++ -Wall -Werror -Wextra -pedantic -O3 -std=c++11 -march=x86-64 -m64 -o geoJson-amd64 geoJson.cpp
	g++ -Wall -Werror -Wextra -pedantic -O3 -std=c++11 -march=i386 -m32 -o geoJson-x86 geoJson.cpp
	g++ -Wall -Werror -Wextra -pedantic -O3 -std=c++11 -march=i386 -m32 -static -o geoJson-x86-static geoJson.cpp

