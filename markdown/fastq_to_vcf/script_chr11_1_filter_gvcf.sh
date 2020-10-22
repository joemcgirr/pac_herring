#!/bin/bash

#SBATCH --job-name=chr11_1_filter_gvcf
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e chr11_1_filter_gvcf_%A_%a.err 
#SBATCH --time=48:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load R 
module load maven 
module load java 
module load GATK/4.1.4.1 

gatk SelectVariants -R /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -V /home/jamcgirr/ph/data/combine_gvcfs/raw_variants_chr11_1.vcf --select-type-to-include SNP -O /home/jamcgirr/ph/data/combine_gvcfs/raw_snps_chr11_1.vcf 

module load vcftools 
vcftools --vcf /home/jamcgirr/ph/data/combine_gvcfs/raw_snps_chr11_1.vcf --get-INFO MQ --get-INFO QUAL --get-INFO SOR --get-INFO DP --get-INFO FS --get-INFO QD --get-INFO MQRankSum --get-INFO ReadPosRankSum 


#command to run: sbatch script_chr11_1_filter_gvcf.sh