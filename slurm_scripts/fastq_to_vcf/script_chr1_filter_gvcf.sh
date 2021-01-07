#!/bin/bash

#SBATCH --job-name=chr1_filter_gvcf
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e chr1_filter_gvcf_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load R 
module load maven 
module load java 
module load GATK/4.1.4.1 

#gatk SelectVariants -R /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -V /home/jamcgirr/ph/data/combine_gvcfs/raw_variants_chr1_1.vcf --select-type-to-include SNP -O /home/jamcgirr/ph/data/combine_gvcfs/raw_snps_chr1_1.vcf 

module load vcftools 
vcftools --vcf /home/jamcgirr/ph/data/combine_gvcfs/raw_snps_chr1_1.vcf --remove-indels --maf 0.05 --min-alleles 2 --max-alleles 2 --minQ 20 --minDP 600 --maxDP 2000 --recode --recode-INFO-all --out /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr1_1_delete 

#gatk SelectVariants -R /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -V /home/jamcgirr/ph/data/combine_gvcfs/raw_variants_chr1_2.vcf --select-type-to-include SNP -O /home/jamcgirr/ph/data/combine_gvcfs/raw_snps_chr1_2.vcf 

vcftools --vcf /home/jamcgirr/ph/data/combine_gvcfs/raw_snps_chr1_2.vcf --remove-indels --maf 0.05 --min-alleles 2 --max-alleles 2 --minQ 20 --minDP 600 --maxDP 2000 --recode --recode-INFO-all --out /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr1_2_delete 

module load samtools 
module load bcftools 
bcftools filter -Oz -i 'MQ>30' /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr1_1_delete.recode.vcf -o /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr1_1.recode.vcf.gz 
bcftools filter -Oz -i 'MQ>30' /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr1_2_delete.recode.vcf -o /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr1_2.recode.vcf.gz 
bcftools index /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr1_1.recode.vcf.gz 
bcftools index /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr1_2.recode.vcf.gz 

#rm /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr1_1_delete.recode.vcf 
#rm /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr1_2_delete.recode.vcf 


#run: sbatch script_chr1_filter_gvcf.sh