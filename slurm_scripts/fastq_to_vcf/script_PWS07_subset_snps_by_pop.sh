#!/bin/bash

#SBATCH --job-name=PWS07_subset_snps_by_pop
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e PWS07_subset_snps_by_pop_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load samtools 
module load bcftools 
bcftools view -S population_PWS07.txt -O z /home/jamcgirr/ph/data/combine_gvcfs/merged_filtered_snps.bcf > /home/jamcgirr/ph/data/combine_gvcfs/population_PWS07_snps.vcf.gz 
module load vcftools 
vcftools --gzvcf /home/jamcgirr/ph/data/combine_gvcfs/population_PWS07_snps.vcf.gz --max-missing 0.8 --recode-INFO-all --recode --stdout | bgzip -c > /home/jamcgirr/ph/data/combine_gvcfs/population_PWS07_filtered_snps.vcf.gz 
bcftools index /home/jamcgirr/ph/data/combine_gvcfs/population_PWS07_filtered_snps.vcf.gz 



#command to run: sbatch script_PWS07_subset_snps_by_pop.sh