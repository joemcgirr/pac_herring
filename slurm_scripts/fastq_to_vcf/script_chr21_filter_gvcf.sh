#!/bin/bash

#SBATCH --job-name=chr21_filter_gvcf
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e chr21_filter_gvcf_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load samtools 
module load bcftools 

bcftools view -S /home/jamcgirr/ph/data/combine_gvcfs/plates_1_through_5_rm.txt -m2 -M2 -v snps /home/jamcgirr/ph/data/combine_gvcfs/raw_variants_chr21_1.vcf | bcftools +fill-tags -- -t all,'DP=sum(DP)' | bcftools filter -Oz -i 'MQ>30 && QUAL>20 && INFO/DP>600 && INFO/DP<2000' -o /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr21_1.recode.vcf.gz 
bcftools view -S /home/jamcgirr/ph/data/combine_gvcfs/plates_1_through_5_rm.txt -m2 -M2 -v snps /home/jamcgirr/ph/data/combine_gvcfs/raw_variants_chr21_2.vcf | bcftools +fill-tags -- -t all,'DP=sum(DP)' | bcftools filter -Oz -i 'MQ>30 && QUAL>20 && INFO/DP>600 && INFO/DP<2000' -o /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr21_2.recode.vcf.gz 

bcftools index /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr21_1.recode.vcf.gz 
bcftools index /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr21_2.recode.vcf.gz 



#run: sbatch script_chr21_filter_gvcf.sh