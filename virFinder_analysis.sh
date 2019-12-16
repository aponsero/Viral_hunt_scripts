#!/bin/bash

# Path to result directory containing files
DIR="/Users/aponsero/Documents/UA_POSTDOC/projects/Nostoc_project/Lichen_meta/exp2_Viral_search/VirFinder_default"
DATASET="/Users/aponsero/Documents/UA_POSTDOC/projects/Nostoc_project/Lichen_meta/exp2_Viral_search/dataset1"


OUT="$DIR/results"
CONTIGS="$DIR/viral_contigs"
P_VALUE="0.96"
MIN_LENGTH="500"

#select contigs and print a res_ file in DIR
#Rscript workers/analysis_virFinder.R $DIR $DATASET $P_VALUE $MIN_LENGTH
#get contig sequences from the selection

cd $DIR
for f in res_*;
do
    temp_name=${f%.csv}
    CONTIG="megahit_${temp_name#res_}_R1_QC.fa"
    SELECT_CONTIGS="$OUT/select_$CONTIG"
    FILE="$DATASET/$CONTIG"
    echo $FILE

    while IFS=, read -r nb name length score pvalue
    do
        SHORT=($(echo "$name" | tr ' ' '\n'))                
        NAME=${SHORT:1}
        echo $NAME
        grep -w -A1 $NAME $FILE >> SELECT_CONTIGS
    done < $f
done

