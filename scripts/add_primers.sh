#!/bin/bash
# usage: ./add_primers.sh <BEGINNING> <END> <OUTFOLDER>

awk -v s="$1" -v e="$2" '{print s $1 e}' ../$OUTFOLDER/guides.txt > ../$OUTFOLDER/guides_primers.txt
