#!/bin/bash

#SBATCH --job-name=subset_chr7
#SBATCH --mem=16G 
#SBATCH --ntasks=8 
#SBATCH -e subset_chr7_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools
bcftools view /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz -r chr7 -Oz --threads 8 > ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05_chr7.vcf.gz


#command to run: sbatch script_subset_chr7.sh