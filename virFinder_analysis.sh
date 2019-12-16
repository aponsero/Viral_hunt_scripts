#!/bin/bash

# Path to result directory containing files
DIR="../VirFinder_default"
DATASET="../dataset1"


OUT="$DIR/results"
CONTIGS="$DIR/viral_contigs"
P_VALUE="0.96"
MIN_LENGTH="500"

Rscript workers/analysis_virFinder.R $DIR $DATASET $P_VALUE $MIN_LENGTH
