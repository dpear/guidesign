#!/bin/bash

# Usage: ./get_strands.sh <GENELIST> <GENELIST WITH STRANDS OUTPUT FILE NAME>

echo 'gene	gene_strand' > $2

genes=$(cat $1)

# extract the strand info from the gff file
for gene in ${genes[@]}; do 
	grep gene=$gene ../files/condensedGRCh38_latest_genomic.gff | sed "s/ /_/" | awk -v g="$gene" '{print g"\t"$7}' | head -n 1 >> $2
	count=$(grep -c gene=$gene ../files/condensedGRCh38_latest_genomic.gff)
	if [ $count -eq 0 ]; then
		echo $gene 'was not matched with strand'
	fi
done



