#!/bin/bash

# Usage: ./lookups.sh <GENELISt>
# Returns all names in your gene list that do NOT appear in the gene table

for line in $(cat $1); do 
	c=$(grep --count $line ../chopchop/isoforms/hg38.gene_table)
	if [ $c -eq 0 ]; then
		echo $line
	fi 
done 
