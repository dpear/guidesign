Guide Design README
How to use the features and scripts in this folder

############## Getting chopchop guides from genelist ################

1. store gene list in file named full_gene_list.txt
2. run: ./lookups.sh
- this will inform you of any gene names that do not appear in the gene table that chopchop uses. If you are using a different gene list, you will have to edit this file to change the path to hg38.gene_table or whatever you are using
- you then will manually have to google each misnomer and find which cannonical ensemble name is in the gene table. the script to make these changes is in replacements.sh
3. run: ./replacements.sh
- this will store the correct gene list in a file called full_gene_list_revised.txt
4. run: ./get_strands.sh
- this will give you which strand each gene is on, important for post processing
- this script uses a file: condensedGRCh38_latest_genomic.gff, which only contains lines matching with genes in the gene list. the original file was downloaded from: https://www.ncbi.nlm.nih.gov/genome/guide/human/
5. run ./getguides.sh <OUTFOLDER>
- runs ./all_genes_chopchop.sh, which gets chopchop guides for all genes
- make sure the directory is in the format ../directory or ../diff_name.
- ./local_chopchop.sh runs chopchop from the chopchop directory, so if there is no .. the folder will be saved in the chopchop directory, or there will be errors.
6. run ./merge.sh
- puts all tsv files into one file with one header
- initially there was an issue with using sed, but resolved by using ~ instead of / as separators
7. run ./sep_chr.sh ../OUTFOLDER/all.tsv
- separates <chr1:30> into <chr1	30> saves in file in <files> directory all_sep.tsv
- only formatting, but necessary
8. trim.sh needs some work to account for changes in the base editing window.





############## VEP Analysis Pipeline #############

sep_chr.sh - separates the chopchop output merged file to contain two columns for chromosome location. one for the location and one for the chromosome. outputs file in ../files/all_sep.tsv. 
# ./sep_chr.sh ../fullgetelist/all.tsv
## output: ../files/all_sep.tsv

nucleotides.sh - obtains the line number and locations of all C's in the editing window. Outputs ../files/indexes.txt
# ./nucleotides.sh <A,C>
## output: ../files/indexes.txt

strand_parsing.R - writes a file containing amino acid changes for all locations in all_sep.tsv. Outputs ../files/VEPchanges.txt
## output: ../files/VEPchanges.txt

something strange happens between lines 1750 and 1850 when chr10 -> chr 11 ??? investigate

final_VEP_changes.sh - formatting. Outputs ../files/VEPchanges_final.txt

