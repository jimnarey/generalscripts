#!/bin/bash 
 
this_usage () {
    echo "Usage: $(basename $0) [url]"
    exit 0
}

if [[ ( $@ == "--help") ||  $@ == "-h" ]]
then 
	this_usage
fi

lynx -listonly -nonumbers -dump -hiddenlinks=ignore $1 | tee .links.txt

while read url; do axel $url -a -c; done < .links.txt 

rm .links.txt