# Guide Design README

### Suggested Pipeline: Getting chopchop guides from a gene list ###

1. Store gene list in file. One gene name per line.  >- bedtools getfasta
2. Run: ```sh lookups.sh <GENELIST>```
- This will inform you of any gene names that do not appear in the gene table that chopchop uses. If you are using a different gene list, you will have to edit this file to change the path to hg38.gene_table or whatever you are using.
- Suggestion: google each misnomer and find which cannonical ensemble name is in the gene table. The script to make these changes is in replacements.sh
3. Edit and run: ```./replacements.sh <GENE LIST> <MODIFIED GENE LIST FILE NAME>```
4. Run: ```./get_strands.sh <GENE LIST> <GENE LIST WITH STRAND OUTPUT FILE NAME> <GFF FILE>```
- This will create a new file that has two columns (with header): gene, gene_strand.
- Make sure to use the modified gene list you just created.
- This assumes your gff file has strand information in the 7th column.
- This will give you which strand each gene is on, important for post processing.
- This script uses a file: condensedGRCh38_latest_genomic.gff, which only contains lines matching with genes in the gene list. the original file was downloaded from [NCBI](https://www.ncbi.nlm.nih.gov/genome/guide/human/)
5. Run: ```./getguides.sh <OUTFOLDER> <GENE LIST>```
- Use the gene list without strands
- Runs ```./all_genes_chopchop.sh```, which gets chopchop guides for all genes
6. Run: ```./merge.sh <OUTFOLDER>```
- Puts all .tsv files into one file with one header, adds a column for gene name.
- Stores result in ```<OUTFOLDER>/all.tsv```
- Might have to edit the functionality of sed in the script.
~~- initially there was an issue with using sed, but resolved by using ~ instead of / as separators

7. Run: ```./sep_chr.sh <FILE>```
- Takes a file with chromosome location format <chr1:30> and changes into <chr1	30>
- Saves file in format ```<FILE>-sep```
- Only formatting, but necessary
8. trim.sh needs some work to account for changes in the base editing window.





############## VEP Analysis Pipeline #############

nucleotides.sh - obtains the line number and locations of all C's in the editing window. Outputs ../files/indexes.txt
# ./nucleotides.sh <A,C>
## output: ../files/indexes.txt

strand_parsing.R - writes a file containing amino acid changes for all locations in all_sep.tsv. Outputs ../files/VEPchanges.txt
## output: ../files/VEPchanges.txt

something strange happens between lines 1750 and 1850 when chr10 -> chr 11 ??? investigate

final_VEP_changes.sh - formatting. Outputs ../files/VEPchanges_final.txt

