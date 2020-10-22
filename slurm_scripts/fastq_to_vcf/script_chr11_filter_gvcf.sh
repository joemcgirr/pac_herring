#!/bin/bash

#SBATCH --job-name=chr11_filter_gvcf
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e chr11_filter_gvcf_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load R 
module load maven 
module load java 
module load GATK/4.1.4.1 

#gatk SelectVariants -R /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -V /home/jamcgirr/ph/data/combine_gvcfs/raw_variants_chr11_1.vcf --select-type-to-include SNP -O /home/jamcgirr/ph/data/combine_gvcfs/raw_snps_chr11_1.vcf 

module load vcftools 
vcftools --vcf /home/jamcgirr/ph/data/combine_gvcfs/raw_snps_chr11_1.vcf --remove-indels --maf 0.05 --min-alleles 2 --max-alleles 2 --minQ 20 --minDP 600 --maxDP 2000 --recode --recode-INFO-all --out /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr11_1_delete 

#gatk SelectVariants -R /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -V /home/jamcgirr/ph/data/combine_gvcfs/raw_variants_chr11_2.vcf --select-type-to-include SNP -O /home/jamcgirr/ph/data/combine_gvcfs/raw_snps_chr11_2.vcf 

vcftools --vcf /home/jamcgirr/ph/data/combine_gvcfs/raw_snps_chr11_2.vcf --remove-indels --maf 0.05 --min-alleles 2 --max-alleles 2 --minQ 20 --minDP 600 --maxDP 2000 --recode --recode-INFO-all --out /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr11_2_delete 

module load samtools 
module load bcftools 
bcftools filter -Oz -i 'MQ>30' /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr11_1_delete.recode.vcf -o /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr11_1.recode.vcf.gz 
bcftools filter -Oz -i 'MQ>30' /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr11_2_delete.recode.vcf -o /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr11_2.recode.vcf.gz 
bcftools index /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr11_1.recode.vcf.gz 
bcftools index /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr11_2.recode.vcf.gz 

rm /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr11_1_delete.recode.vcf 
rm /home/jamcgirr/ph/data/combine_gvcfs/filtered_snps_chr11_2_delete.recode.vcf 


#command to run: sbatch script_chr11_filter_gvcf.sh