#!/bin/sh

i=0
IFS="
"

for line in $(dpkg -l | tail -n +6 | sed -e 's/\S\+\s\+\S\+\s\+\S\+\s\+\S\+\s\+\(.*\)/\1/g' | uniq -d)
do
	i=$(( i + 1 ))
	echo Packages with description: "$line"
	dpkg -l | grep "$line" | sed -e 's/\(\S\+\s\+\S\+\s\+\S\+\s\+\S\+\s\+\).*/\1/g'
	echo
done

echo "$i descriptions detected in more than one package."
