#!/bin/bash

#SBATCH --job-name=isec
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e isec_%A_%a.err 
#SBATCH --time=144:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
bcftools isec -n=14 -p isec_test --threads 4 /home/jamcgirr/ph/data/combine_gvcfs/population_BC17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_CA17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_PWS07_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_PWS17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_PWS91_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_PWS96_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_SS06_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_SS17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_SS96_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_TB06_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_TB17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_TB91_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_TB96_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_WA17_filtered_snps.vcf.gz 



#run: sbatch script_isec.sh