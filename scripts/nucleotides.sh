#!/bin/bash


# C nucleotide
if [ $1 = C ]; then
	cat ../files/all_sep.tsv | awk '{print $3}' | grep -Po '[AGTC]{15}' | grep -v Target | sed ':a;N;$!ba;s/\n/ /g' | sed "s/ //g" | grep -aob C | sed -r "s/:/\t/" | awk '{print $0}' | awk '{print $1+1}' | awk '{print $1 "\t" $1%15}' | awk '{print $0 "\t" (($1-$2)/15)+1}' | awk '{print $2 "\t" $3}' | sed -r "s/^0\t/15\t/" > ../files/indexes.txt 
fi

# A nucleotide
if [ $1 = A ]; then
	cat ../files/all_sep.tsv | awk '{print $3}' | grep -Po '^[AGTC]{8}' | grep -v Target | grep -Po '[ACTG]{6}$' | sed ':a;N;$!ba;s/\n/ /g' | sed "s/ //g" | grep -aob A | sed -r "s/:/\t/" | awk '{print $0}' | awk '{print $0"\t"($1%6)+3}' | awk '{print $0 "\t" (($1-($1%6))/6)+1}' | awk '{print $3"\t"$4}' > ../files/indexes.txt
fi
