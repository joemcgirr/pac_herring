#!/bin/bash

#SBATCH --job-name=isec_0.8
#SBATCH --mem=16G 
#SBATCH --ntasks=8 
#SBATCH -e isec_0.8_%A_%a.err 
#SBATCH --time=144:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
bcftools isec -n=14 -p isec_test_0.8 --threads 8 /home/jamcgirr/ph/data/combine_gvcfs/isec_0.8/population_BC17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/isec_0.8/population_CA17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/isec_0.8/population_PWS07_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/isec_0.8/population_PWS17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/isec_0.8/population_PWS91_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/isec_0.8/population_PWS96_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/isec_0.8/population_SS06_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/isec_0.8/population_SS17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/isec_0.8/population_SS96_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/isec_0.8/population_TB06_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/isec_0.8/population_TB17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/isec_0.8/population_TB91_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/isec_0.8/population_TB96_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/isec_0.8/population_WA17_filtered_snps.vcf.gz 



#run: sbatch script_isec_0.8.sh