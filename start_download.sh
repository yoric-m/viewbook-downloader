#!/bin/bash

# We'll download into the albums folder
if [ ! -d "albums" ]; then
  mkdir "albums"
fi

# Call wget for each line of the file containing the links
IFS=#
while read url fileName
do
    wget -c -O albums/${fileName//[^A-Za-z0-9._-]/_}.zip "$url"
done < download_list
