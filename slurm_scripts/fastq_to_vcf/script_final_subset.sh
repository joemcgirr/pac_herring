#!/bin/bash

#SBATCH --job-name=final_subset
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e final_subset_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools
bcftools index /home/jamcgirr/ph/data/combine_gvcfs/merged_filtered_snps.bcf 
bcftools view -R sites_in_all_pop_vcfs.txt /home/jamcgirr/ph/data/combine_gvcfs/merged_filtered_snps.bcf -Oz > /home/jamcgirr/ph/data/combine_gvcfs/isec_test_all_pops.vcf.gz


#command to run: sbatch script_final_subset.sh