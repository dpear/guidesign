#!/bin/bash
# usage: ./filter <MAX_MM> <MAX_OFF> <OUTFOLDER> <OUTFOLDER/TRIMFOLDER> <OUTFOLDER/FILTERFOLDER>

MAX_MM=$1 # 0 1 2 3
MAX_OFF=$2 # any number
OUTFOLDER=$3
TRIMFOLDER=$4
FILTERFOLDER=$5

if [ $MAX_MM = 0 ]; then
	cat ../$OUTFOLDER/$TRIMFOLDER/all.tsv | awk -v m="$MAX_OFF" '{print $0"\t"$8"\t"m}' | awk '$13<$14' > ../$OUTFOLDER/all_filtered.tsv
elif [ $MAX_MM = 1 ]; then
        cat ../$OUTFOLDER/$TRIMFOLDER/all.tsv |  awk -v m="$MAX_OFF" '{print $0"\t"$8+$9"\t"m}' | awk '$13<$14' > ../$OUTFOLDER/all_filtered.tsv
elif [ $MAX_MM = 2 ]; then
        cat ../$OUTFOLDER/$TRIMFOLDER/all.tsv |  awk -v m="$MAX_OFF" '{print $0"\t"$8+$9+$10"\t"m}' | awk '$13<$14' > ../$OUTFOLDER/all_filtered.tsv
elif [ $MAX_MM = 3 ]; then
        cat ../$OUTFOLDER/$TRIMFOLDER/all.tsv |  awk -v m="$MAX_OFF" '{print $0"\t"$8+$9+$10+$11"\t"m}' | awk '$13<$14' > ../$OUTFOLDER/all_filtered.tsv
elif [ $MAX_MM = G ]; then
	cat ../$OUTFOLDER/$TRIMFOLDER/all.tsv | awk '$8<1' | awk '$9<3' > ../$OUTFOLDER/$TRIMFOLDER/all_filtered.tsv
fi

cat ../$OUTFOLDER/$TRIMFOLDER/all_filtered.tsv | awk '{print $3}' | tail -n +2 > ../$OUTFOLDER/$TRIMFOLDER/guides.txt

