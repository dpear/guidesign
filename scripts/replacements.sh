#!/bin/bash

# Usage: ./replacements.sh <GENELIST> <MODIFIED GENE LIST NAME>

# Modify the necessary edits to the gene list below.
# sed is a command for inline file editing, google it or type `man sed` in the terminal for more information
# If you're new to this kind of thing the format is: sed "s/<old name>/<new name>/"

cat $1 | sed "s/C9ORF78/C9orf78/" | sed "s/LUC7LA/LUC7L3/" | sed "s/DGCR14/ESS2/" > $2
