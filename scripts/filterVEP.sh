#!/bin/bash

FILE='../files/results.vep.txt'
cat $FILE | awk '{print $1 "\t" $11 "\t" $12}' | sort -g  | uniq | grep -vP "\-\t\-" > ../files/filtered_VEP_results.tsv
