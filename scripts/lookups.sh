#!/bin/bash

for line in $(cat full_gene_list.txt); do 
	c=$(grep --count $line ../chopchop/isoforms/hg38.gene_table)
	if [ $c -eq 0 ]; then
		echo $line
	fi 
done 
