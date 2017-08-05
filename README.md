# geoJson
GPX to GeoJSON converter

This is a small GPX to GeoJson converter utility that I hacked within an hour while chatting

It utilised rapidxml and is pretty fast.

## Installation

rapidxml is included in the archive in the version 1.13.
No further dependencies required

Build and install the tool with

    make
    sudo make install

The program will be installed to /usr/local/bin by default

## Usage

Print the help message (right now not so useful)

    geoJson -h

By default the program reads from stdin until the end and then parses the input.

Convert the file FILE.gpx to GeoJson 

    geoJson FILE.gpx

The file prints the GeoJson to standart output. If you want to write it to a file use -o

    geoJson FILE.gpx -o FILE.json

## Demo

An an example I provide the following file from Wikiloc: [iceland-landmannalaugar-porsmork.gpx](https://www.wikiloc.com/wikiloc/view.do?id=1120806)

Test it with

    geoJson -o iceland-landmannalaugar-porsmork.json iceland-landmannalaugar-porsmork.gpx

This write the file *iceland-landmannalaugar-porsmork.gpx* to *iceland-landmannalaugar-porsmork.json*
    
### Comparison to togeojson

Originally I used the tool [togeojson](https://github.com/mapbox/togeojson), witch is a quiet nice tool but it works with Node.js
and I don't see why using Node.js for such a small tool. Although performance is probably not an issue for this task I took it as a
challenge :-)

Benchmark on my FX-8350 using *togeojson*

    $ time togeojson iceland-landmannalaugar-porsmork.gpx >/dev/null
    real	0m0.563s
    user	0m0.680s
    sys	0m0.032s

Same input file, same processor, now my tool

    $ time geoJson iceland-landmannalaugar-porsmork.gpx >/dev/null
    real	0m0.040s
    user	0m0.024s
    sys	0m0.012s

Compare it yourself and feel free to share!
