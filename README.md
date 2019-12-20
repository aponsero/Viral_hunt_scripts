# Viral_hunt_scripts
scripts for the analysis and retrieval of viral contigs in metagenomes

## dependencies
Thes scripts require R v3.6.1 and the following libraries:
- Dplyr
- tiduverse
- stringR

## scripts description

### Marvel_analysis.sh
This script takes the output directory of MARVEL and output result tsv table at the following format: "pos", "name", "length"

### VirFinder_analysis.sh
This script takes the output directory of VirFinder and output result tsv tables with the following format: "nb","name","length","score","pvalue"