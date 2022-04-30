#!/bin/bash 
 
this_usage () {
    echo "Usage: $(basename $0) [url] [ext]"
    exit 0
}

if [[ ( $@ == "--help") ||  $@ == "-h" ]]
then 
	this_usage
fi

lynx -listonly -nonumbers -dump -hiddenlinks=ignore $1 | tee .links.txt
cat .links.txt | grep "$2$" | tee .downloads.txt

while read url; do axel $url -a -c; done < .downloads.txt 

# rm .links.txt .downloads.txt