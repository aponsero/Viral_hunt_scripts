#!/bin/bash


#path to folders named using the sample_name and containing the viral bins
CONTIG_DIR="/Users/aponsero/Documents/UA_POSTDOC/projects/Nostoc_project/Lichen_meta/exp2_Viral_search/dataset1"
#path to outdir
OUT="/Users/aponsero/Documents/UA_POSTDOC/projects/Nostoc_project/Lichen_meta/exp2_Viral_search/selection1"

cd $OUT
for f in *.csv ; do
    S1=${f#list_}
    S2=${S1%.csv}
    SAMPLE="${CONTIG_DIR}/megahit_${S2}_R1_QC.fa"
    OUT_FILE="${OUT}/contigs_${S2}.fa"
    echo $SAMPLE
    {
    read
    while IFS=" flag=" read -r name stuff
    do
        contig=">${name:1}"
        grep -A1 -w $contig $SAMPLE >> $OUT_FILE 
    done
    } < $f
done



