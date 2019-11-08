#!/bin/bash

# Usage: ./get_strands.sh <GENELIST> <GENELIST WITH STRANDS OUTPUT FILE NAME> <GFF FILE>
# This assumes your gff file has strand information in the 7th column.
inf=$1
outf=$2
gff=$3

echo 'gene	gene_strand' > $outf
genes=$(cat $inf)

# extract the strand info from the gff file
for gene in ${genes[@]}; do 
	grep gene=$gene $gff | sed "s/ /_/" | awk -v g="$gene" '{print g"\t"$7}' | head -n 1 >> $outf
	count=$(grep -c gene=$gene $gff)
	if [ $count -eq 0 ]; then echo $gene 'was not matched with strand'; fi
done



