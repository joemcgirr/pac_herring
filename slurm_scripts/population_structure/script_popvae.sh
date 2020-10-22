#!/bin/bash

#SBATCH --job-name=popvae
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e popvae_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load vcftools 
module load vcftools 
module load vcftools 
