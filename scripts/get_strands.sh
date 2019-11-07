#!/bin/bash

echo 'gene	gene_strand' > ../files/strand_info.txt

genes=$(cat full_gene_list_revised.txt)

# extract the strand info from the gff file
for gene in ${genes[@]}; do 
	grep gene=$gene ../files/condensedGRCh38_latest_genomic.gff | sed "s/ /_/" | awk -v g="$gene" '{print g"\t"$7}' | head -n 1 >> ../files/strand_info.txt
	count=$(grep -c gene=$gene ../files/condensedGRCh38_latest_genomic.gff)
	if [ $count -eq 0 ]; then
		echo $gene 'was not matched with strand'
	fi
done



