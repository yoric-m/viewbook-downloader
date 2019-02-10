#!/bin/bash

# create the cookies file
php format_cookie.php

sleep 1
echo "Cookies formated"

# Get the html containing albums ids and keys
wget -o log -O file --load-cookies cookies https://app.viewbook.com/albums/?sort=date&order=desc&page=1&per_page=500

# We make sure the file is finished downloading before continuing
oldline=-1
nbline=0
count=0
while [ "$count" -lt 10 ] && [ "$oldline" -ne "$nbline" ]
do
  oldline="$nbline"
  sleep 2
  nbline=$(wc -l < file)
  if [ "$oldline" -ne "$nbline" ]
  then
    echo "$nbline lines processed..."
  fi
  count=$((count+1))
done

# Extract the download url, and the album name
awk -F '[<>]' '/<name>/{ name = $3 } /download_url/ { num++; printf "%s#%03d_%s\n", $3, num, name; num++ }' file | sed 's;?;/complete?;g' > download_list

echo "Download list ready"

# Remover temporary files
rm file
rm cookies
rm log
