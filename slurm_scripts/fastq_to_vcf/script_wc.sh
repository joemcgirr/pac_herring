#!/bin/bash

#SBATCH --job-name=wc
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e wc_%A_%a.err 
#SBATCH --time=8:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p med

wc -l /home/jamcgirr/ph/data/combine_gvcfs/raw_variants_chr1_1.vcf > lines_chr1_1.txt


#command to run: sbatch script_wc.sh