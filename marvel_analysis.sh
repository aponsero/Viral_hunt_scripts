#!/bin/bash


#path to folders named using the sample_name and containing the viral bins
DIR="/rsgrps/bhurwitz/alise/my_data/Nostoc_project/Lichen_metagenomes/experiments/2-Viral_search_assembly1/marvel/viral_contigs"
#path to outdir
OUT="/rsgrps/bhurwitz/alise/my_data/Nostoc_project/Lichen_metagenomes/experiments/2-Viral_search_assembly1/marvel/results"
#path to name maping file
MAP=""

cd $DIR
for d in */ ; do
    echo "$d"
    SAMPLE_NAME=${d%/}
    for file in $d/*.fasta; 
    do 
        grep ">" $file | cut -c4- >> $OUT/${SAMPLE_NAME}_marvel.txt; 
    done

done

module load R
Rscript map_names.R $OUT $MAP
