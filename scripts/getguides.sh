#!/bin/bash
# usage: ./getguides.sh <OUTFOLDER> <GENE LIST>
## outdated ## # usage: ./getguides.sh <C or A> <EDIT_WINDOW> <GENELIST> <MAX_MMISMATCHES> <MAX_OFFTARGETS> <OUTFOLDER>

OUTFOLDER=$1
GENELIST=$2

mkdir $OUTFOLDER
mkdir $OUTFOLDER/genes
mkdir $OUTFOLDER/tsv
#mkdir ../$OUTFOLDER/tsv_trimmed ## outdated ##

./all_genes_chopchop.sh $OUTFOLDER $GENELIST

## outdated ## 
#./trim.sh $BASE $WINDOW $OUTFOLDER
#./merge.sh $OUTFOLDER 
#./filter.sh $MAX_MM $MAX_OFF $OUTFOLDER

#echo 'genelist:' $GENELIST > ../$OUTFOLDER/info.txt
#echo 'base:' $BASE >> ../$OUTFOLDER/info.txt
#echo 'window:' $WINDOW >> ../$OUTFOLDER/info.txt
#echo 'max mismatches allowed:' $MAX_MM >> ../$OUTFOLDER/info.txt
#echo 'max off targets allowed:' $MAX_OFF >> ../$OUTFOLDER/info.txt

