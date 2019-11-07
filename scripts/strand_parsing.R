#!/usr/bin/env Rscript
library(dplyr)

all = read.csv('../files/all_sep.tsv',sep="\t",header=FALSE)
all = all[-1,]
colnames(all) = c('gene','Rank','Target_sequence','chr','Genomic_location','Strand','GC_content_(%)','Self-complementarity','MM0','MM1','MM2','MM3','Efficiency')

strand = read.csv('../files/strand_info.txt',sep="\t",header=TRUE)

all_with_strand = left_join(all,strand)
all_with_strand$line_number = seq(1:(nrow(all_with_strand)))
index = read.csv('../files/indexes.txt',header=FALSE,sep='\t')
colnames(index) = c('pos','line_number')

# determine if the index file has A or C changes
ch = 'A'
altch = 'T'
if (max(index$pos)>10) {ch = 'C'; altch='G'}

all_changes = left_join(index,all_with_strand)

# CASE 1: + + ex. USP39 guide 32 (website)
all_changes$finalpos[all_changes$Strand=='+' & all_changes$gene_strand=='+']=all_changes$Genomic_location[all_changes$Strand=='+' & all_changes$gene_strand=='+']+all_changes$pos[all_changes$Strand=='+' & all_changes$gene_strand=='+']-1

all_changes$nucleotide[all_changes$Strand=='+' & all_changes$gene_strand=='+'] = ch

# CASE 2: + - ex. USP39 guide 33 (website)
all_changes$finalpos[all_changes$Strand=='-' & all_changes$gene_strand=='+']= all_changes$Genomic_location[all_changes$Strand=='-' & all_changes$gene_strand=='+'] + 23 - all_changes$pos[all_changes$Strand=='-' & all_changes$gene_strand=='+'] + 1

all_changes$nucleotide[all_changes$Strand=='-' & all_changes$gene_strand=='+']= altch

# CASE 3: - - ex. ACIN1 guide 10 (website)
all_changes$finalpos[all_changes$Strand=='-' & all_changes$gene_strand=='-'] = all_changes$Genomic_location[all_changes$Strand=='-' & all_changes$gene_strand=='-'] + 23 - all_changes$pos[all_changes$Strand=='-' & all_changes$gene_strand=='-']

all_changes$nucleotide[all_changes$Strand=='-' & all_changes$gene_strand=='-']= altch

# CASE 4: - + ex. ACIN1 guide 9 (website)
all_changes$finalpos[all_changes$Strand=='+' & all_changes$gene_strand=='-'] = all_changes$Genomic_location[all_changes$Strand=='+' & all_changes$gene_strand=='-'] + all_changes$pos[all_changes$Strand=='+' & all_changes$gene_strand=='-'] - 1

all_changes$nucleotide[all_changes$Strand=='+' & all_changes$gene_strand=='-']= ch

# track only the changes necessary
changes = data.frame(chromosome=all_changes$chr,start=all_changes$finalpos,end=all_changes$finalpos,reference=all_changes$nucleotide,strand=all_changes$gene_strand)

if (ch == 'C'){
	# add all possible changes from the beast
	c2hanges = changes[rep(seq_len(nrow(changes)), each=3),] # repeat each line 3 times
	c2hanges$mutation = rep(c('A','T','-'),nrow(changes)) # repeat a t - (- to be replaced by C or G depending on nucleotide/ strand) 
	c2hanges$mutation2 = c2hanges$mutation # copy the column
	c2hanges$mutation2[c2hanges$mutation=='-' & c2hanges$reference=='G'] = 'C' # columns with reference G get changed to C
	c2hanges$mutation2[c2hanges$mutation2=='-'] = 'G' # columns with reference C get changed to G
} else {
	c2hanges = changes
	c2hanges$mutation = rep('-',nrow(changes))
	c2hanges$mutation2[c2hanges$reference=='A'] = 'G'
	c2hanges$mutation2[c2hanges$reference=='T'] = 'C'
}
write.table(c2hanges, '../files/VEPchanges.txt', append = FALSE, sep = "\t",row.names = FALSE, col.names = FALSE)
