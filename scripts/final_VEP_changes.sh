#!/bin/bash
# usage: ./final_vep_changes.sh

cat ../files/VEPchanges.txt | sed "s/\"//g" | awk '{print $1"\t"$2"\t"$3"\t"$4"/"$7"\t"$5}' > ../files/VEPchanges_final.txt

