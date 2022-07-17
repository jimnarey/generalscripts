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
cat .links.txt | grep "$2$" | tee .downloads.txt
sed -i 's/ /%20/g' .downloads.txt

cat .downloads.txt

wget -i .downloads.txt

rm .links.txt .downloads.txt
