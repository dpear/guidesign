#!/bin/bash
# ex. ./all_genes_chopchop.sh <OUTFOLDER>

OUTFOLDER=$1
GENELIST=$2

for gene in $(cat $GENELIST); do
	./local_chopchop.sh $gene $OUTFOLDER
done

#untested because i deleted the original
