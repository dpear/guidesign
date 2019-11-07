#!/bin/bash
# usage: ./trim.sh <BASE> <WINDOW> <OUTFOLDER> <OUTFOLDER/TRIMFOLDER>
# automatically takes files from out_chop/tsv, trims, puts in specified directory 
BASE=$1
WINDOW=$2
OUTFOLDER=$3
TRIMFOLDER=$4
mkdir ../$OUTFOLDER/$TRIMFOLDER

if [ $BASE = C ]; then
	match="\t[AGT]{$WINDOW}"
	for tsv in $(ls ../$OUTFOLDER/tsv/*); do
        	base=$(echo $tsv | xargs -n 1 basename)
        	grep -P -v $match $tsv > ../$OUTFOLDER/${base}.tr
	done
elif [ $BASE = A ]; then
	match="[GCTA]{2}[GTC]{6}[GTCA]{12}.GG"
	for tsv in $(ls ../$OUTFOLDER/tsv/*); do
        	base=$(echo $tsv | xargs -n 1 basename)
        	grep -P -v $match $tsv > ../$OUTFOLDER/${base}.tr
	done
elif [ $BASE = CA ]; then
	for tsv in $(ls ../$OUTFOLDER/tsv/*); do
		base=$(echo $tsv | xargs -n 1 basename)
		grep -P -v "[GCTA]{2}[GTC]{6}[GTCA]{12}.GG" $tsv > ../$OUTFOLDER/$TRIMFOLDER/${base}.tr
		grep -P "[GCTA]{2}[GTC]{6}[GTCA]{12}.GG" $tsv | grep -P -v "\t[AGT]{15}" >> ../$OUTFOLDER/$TRIMFOLDER/${base}.tr
	done
fi

original=$(wc -l ../$OUTFOLDER/tsv/* | tail -n 1 | grep -P -o [0-9]*)
new=$(wc -l ../$OUTFOLDER/$TRIMFOLDER/* | tail -n 1 | grep -P -o [0-9]*)
echo "$original total guides trimmed to $new "
echo "excluding guides with no $BASE in editing window of $WINDOW"
