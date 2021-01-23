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
bcftools merge -O z --threads 16 -o /home/jamcgirr/ph/data/vcfs/bcftools_filter/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_maxmiss0.8_0.8forreal_outliers_rm.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_BC17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_CA17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_PWS07_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_PWS17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_PWS91_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_PWS96_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_SS06_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_SS17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_SS96_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_TB06_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_TB17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_TB91_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_TB96_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_WA17_filtered_snps.vcf.gz 

bcftools view /home/jamcgirr/ph/data/vcfs/bcftools_filter/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_maxmiss0.8_0.8forreal_outliers_rm.vcf.gz | wc -l > lines_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_maxmiss0.8_0.8forreal_outliers_rm.txt 
#module load vcftools 
#vcftools --vcf /home/jamcgirr/ph/data/vcfs/bcftools_filter/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_maxmiss0.8_0.8forreal_outliers_rm.vcf.gz --BEAGLE-PL --chr chr1 --out /home/jamcgirr/ph/data/vcfs/bcftools_filter/chr1_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_maxmiss0.8_0.8forreal_outliers_rm 
#vcftools --vcf /home/jamcgirr/ph/data/vcfs/bcftools_filter/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_maxmiss0.8_0.8forreal_outliers_rm.vcf.gz --plink --out /home/jamcgirr/ph/data/vcfs/bcftools_filter/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_maxmiss0.8_0.8forreal_outliers_rm 
#module load plink 
#plink --file /home/jamcgirr/ph/data/vcfs/bcftools_filter/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_maxmiss0.8_0.8forreal_outliers_rm --pca --out /home/jamcgirr/ph/data/plink/bcftools_filter/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_maxmiss0.8_0.8forreal_outliers_rm


#run: sbatch script_merge_filtered_pops.sh