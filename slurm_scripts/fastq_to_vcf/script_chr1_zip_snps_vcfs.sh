#!/bin/bash

#SBATCH --job-name=chr1_zip_snps_vcfs
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e chr1_zip_snps_vcfs_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load samtools 
module load bcftools 
bgzip -c /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr1_1.recode.vcf > /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr1_1.recode.vcf.gz 
bgzip -c /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr1_2.recode.vcf > /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr1_2.recode.vcf.gz 
bcftools index /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr1_1.recode.vcf.gz 
bcftools index /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr1_2.recode.vcf.gz 


#command to run: sbatch script_chr1_zip_snps_vcfs.sh