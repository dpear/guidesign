#!/bin/bash
# usage: ./sep_chr.sh <FILE>
# separates the chr1:1234 to chr1	1234
FILE=$1
cat $FILE | sed -r "s/:/\t/" > ${FILE}-sep

