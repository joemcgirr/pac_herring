#!/bin/bash

#SBATCH --job-name=merge_filtered_pops
#SBATCH --mem=16G 
#SBATCH --ntasks=16 
#SBATCH -e merge_filtered_pops_%A_%a.err 
#SBATCH --time=144:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load samtools 
module load bcftools 
bcftools merge -O v --threads 16 -o /home/jamcgirr/ph/data/vcfs/ph_test_delete.vcf /home/jamcgirr/ph/data/combine_gvcfs/population_BC17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_CA17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_PWS07_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_PWS17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_PWS91_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_PWS96_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_SS06_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_SS17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_SS96_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_TB06_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_TB17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_TB91_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_TB96_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_WA17_filtered_snps.vcf.gz 

wc -l /home/jamcgirr/ph/data/vcfs/ph_test_delete.vcf > lines_ph_test_delete.txt 
#module load vcftools 
#vcftools --vcf /home/jamcgirr/ph/data/vcfs/ph_test_delete.vcf --BEAGLE-PL --chr chr1 --out /home/jamcgirr/ph/data/vcfs/chr1_ph_test_delete 
#vcftools --vcf /home/jamcgirr/ph/data/vcfs/ph_test_delete.vcf --BEAGLE-PL --chr chr1,chr2,chr3,chr4,chr5,chr6,chr7,chr8,chr9,chr10,chr11,chr12,chr13,chr14,chr15,chr16,chr17,chr18,chr19,chr20,chr21,chr22,chr23,chr24,chr25,chr26  --out /home/jamcgirr/ph/data/vcfs/ph_test_delete 
#vcftools --vcf /home/jamcgirr/ph/data/vcfs/ph_test_delete.vcf --plink --out /home/jamcgirr/ph/data/vcfs/ph_test_delete 
#module load plink 
#plink --file /home/jamcgirr/ph/data/vcfs/ph_test_delete --pca --out /home/jamcgirr/ph/data/plink/ph_test_delete


#run: sbatch script_merge_filtered_pops.sh