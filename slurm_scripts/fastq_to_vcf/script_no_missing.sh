#!/bin/bash

#SBATCH --job-name=no_missing
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e no_missing_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
bcftools +fill-tags /home/jamcgirr/ph/data/combine_gvcfs/merged_filtered_snps.bcf -- -t all,'DP=sum(DP)' | bcftools filter -Oz -i 'NS>891' > /home/jamcgirr/ph/data/combine_gvcfs/merged_filtered_snps_no_missing.vcf.gz


#command to run: sbatch script_no_missing.sh