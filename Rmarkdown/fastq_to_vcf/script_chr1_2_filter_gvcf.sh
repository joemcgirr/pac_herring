#!/bin/bash

#SBATCH --job-name=chr1_2_filter_gvcf
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e chr1_2_filter_gvcf_%A_%a.err 
#SBATCH --time=48:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load R 
module load maven 
module load java 
module load GATK/4.1.4.1 

gatk SelectVariants -R /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -V /home/jamcgirr/ph/data/combine_gvcfs/raw_variants_chr1_2.vcf --select-type-to-include SNP -O /home/jamcgirr/ph/data/combine_gvcfs/raw_snps_chr1_2.vcf 

module load vcftools 
vcftools --vcf /home/jamcgirr/ph/data/combine_gvcfs/raw_snps_chr1_2.vcf --get-INFO MQ --get-INFO QUAL --get-INFO SOR --get-INFO DP --get-INFO FS --get-INFO QD --get-INFO MQRankSum --get-INFO ReadPosRankSum 


#command to run: sbatch script_chr1_2_filter_gvcf.sh