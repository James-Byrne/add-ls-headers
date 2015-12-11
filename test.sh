#!/bin/bash

# Display the headers for each column
echo " Permissions\t links\t owner\t group\t size\t last modification\t name";

# Variable to discard the "total x" at the beginning of ls -l
# Also used to determine when to add a newline character
r=0;

# For each set of characters (i.e. each column)
for i in $(ls -l);
do
	# Check if r > 1 if not then we are recording "total x"
	# in which case we do nothing and discard
	if [ $r -gt 1 ]
	then
		#Space added before i to stop from executing the write permissions once they are read
		printf " $i";
		# add a tab to keep in line with headers
		printf "\t";
		# add one to r
		r=$((r + 1));		
	else
	        # We always need to increment this to find 
		# the newline characters place	
		r=$((r + 1));
	fi
	
	# If we have parsed 8 characters (10-2=8)
	# Print a newline and reset to 2
	if [ $r -gt 10 ]
	then
		printf "\n";
		# Keeps the algorithm going without ignoring anything
		r=2;
	fi		
done

# Add a line between outline and shell prompt
echo "";
