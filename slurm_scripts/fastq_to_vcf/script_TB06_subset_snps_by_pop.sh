#!/bin/bash

#SBATCH --job-name=TB06_subset_snps_by_pop
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e TB06_subset_snps_by_pop_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
bcftools view -S /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/TB06_plates_1_through_5_rm.txt /home/jamcgirr/ph/data/combine_gvcfs/merged_filtered_snps.bcf | bcftools +fill-tags -- -t all,'DP=sum(DP)' | bcftools filter -Oz -i 'NS>26 ' > /home/jamcgirr/ph/data/combine_gvcfs/population_TB06_filtered_snps.vcf.gz 
bcftools index /home/jamcgirr/ph/data/combine_gvcfs/population_TB06_filtered_snps.vcf.gz 



#command to run: sbatch script_TB06_subset_snps_by_pop.sh