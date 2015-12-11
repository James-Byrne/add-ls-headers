#!/bin/bash

echo " Permissions\t links\t owner\t group\t size\t last modification\t name";

r=0;

for i in $(ls -l);
do
	if [ $r -gt 1 ]
	then
		printf " $i";
		printf "\t";
		r=$((r + 1));		
	else 
		r=$((r + 1));
	fi

	if [ $r -gt 10 ]
	then
		printf "\n";
		r=2;
	fi		
done

echo "";
