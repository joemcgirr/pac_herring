#!/bin/bash

#SBATCH --job-name=unzip
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e unzip_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 


gzip -d population_BC17_filtered_snps.vcf.gz

#run: sbatch unzip.sh