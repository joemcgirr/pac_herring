#!/bin/bash

#SBATCH --job-name=SS96_subset_snps_by_pop
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e SS96_subset_snps_by_pop_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
bcftools view -S /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/SS96_plates_1_through_5_rm.txt /home/jamcgirr/ph/data/combine_gvcfs/merged_filtered_snps.bcf | bcftools +fill-tags -- -t all,'DP=sum(DP)' | bcftools filter -Oz -i 'NS>39 ' > /home/jamcgirr/ph/data/combine_gvcfs/population_SS96_filtered_snps.vcf.gz 
bcftools index /home/jamcgirr/ph/data/combine_gvcfs/population_SS96_filtered_snps.vcf.gz 



#command to run: sbatch script_SS96_subset_snps_by_pop.sh