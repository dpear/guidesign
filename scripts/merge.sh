#!/bin/bash
# usage: sh merge.sh <OUTFOLDER> 
# OUTFOLDER: directory- chopchop output

OUTFOLDER=$1
TRIMFOLDER=$2

files=$(ls $OUTFOLDER/tsv)
for f in ${files[@]}; do file=$f; done
header=$(echo gene $(head -n 1 $OUTFOLDER/tsv/$file | sed -r "s/ s/_s/" | sed -r "s/ l/_l/" | sed -r "s/ c/_c/"  | sed -r "s/ \(/_(/"))
for i in ${files[@]}; do 
	awk '{print FILENAME"\t"$0}' $OUTFOLDER/tsv/$i | sed "1s/.*/$header/" | sed "s/\.tsv//" | sed "s~$OUTFOLDER\/tsv\/~~" | sed -r "s/>=//" > $OUTFOLDER/${i}_1
done
awk 'NR == 1 || FNR > 1' $OUTFOLDER/*_1 > $OUTFOLDER/all.tsv
rm $OUTFOLDER/*_1
