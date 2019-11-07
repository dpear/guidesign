#!/bin/bash

cat full_gene_list.txt | sed "s/C9ORF78/C9orf78/" | sed "s/LUC7LA/LUC7L3/" | sed "s/DGCR14/ESS2/" > full_gene_list_revised.txt
