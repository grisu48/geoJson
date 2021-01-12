# geoJson

![Build status badge](https://github.com/grisu48/geoJson/workflows/geoJson/badge.svg)

This is a small `gpx` to `geojson` converter tool that I hacked within an hour while chatting. It uses rapidxml and is pretty fast.

Fastest way to use this tool in Linux is to use the pre-build static binaries which are published as releases in this repository.

## Build

rapidxml is included in the repository (version 1.13).
No further dependencies required

Build and install the tool with

    make
    sudo make install

The program will be installed to ``/usr/local/bin` by default

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

Back in the time I used the nice tool [togeojson](https://github.com/mapbox/togeojson) for converting a gpx file to geoJson. This tool is written in Node.js
and I wanted hack a simpler and faster tool for doing this task. Although performance is probably not an issue for this task, I took the challenge ;-)

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