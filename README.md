# geoJson
GPX to GeoJSON converter

This is a small GPX to GeoJson converter utility that I quickly hacked within an hour while chatting.

It utilised rapidxml and is pretty fast.

## Installation

rapidxml is included in the archive in the version 1.13.
No further dependencies are required

 make
 sudo make install

## Usage

Print the help message (right now not so useful)
 geoJson -h

To convert the file FILE.gpx to geojson type
 geoJson FILE.gpx

The file prints the GeoJson to standart output. If you want to write it to a file use
 geoJson FILE.gpx > FILE.json

