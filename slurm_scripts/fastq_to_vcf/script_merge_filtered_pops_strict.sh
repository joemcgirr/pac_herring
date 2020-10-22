#!/bin/bash

#SBATCH --job-name=merge_filtered_pops_strict
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e merge_filtered_pops_strict_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#module load samtools 
#module load bcftools 
#bcftools merge -O v --threads 4 -o /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP350_maxDP2000_maf0.05_minQ30_maxmiss0.5.vcf /home/jamcgirr/ph/data/combine_gvcfs/population_BC17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_CA17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_PWS07_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_PWS17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_PWS91_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_PWS96_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_SS06_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_SS17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_SS96_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_TB06_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_TB17_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_TB91_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_TB96_filtered_snps.vcf.gz /home/jamcgirr/ph/data/combine_gvcfs/population_WA17_filtered_snps.vcf.gz 

module load vcftools 
vcftools --vcf /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP350_maxDP2000_maf0.05_minQ30_maxmiss0.5.vcf --BEAGLE-PL --chr chr1 --out /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP350_maxDP2000_maf0.05_minQ30_maxmiss0.5 
#vcftools --vcf /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP350_maxDP2000_maf0.05_minQ30_maxmiss0.5.vcf --BEAGLE-PL --chr chr1,chr2,chr3,chr4,chr5,chr6,chr7,chr8,chr9,chr10,chr11,chr12,chr13,chr14,chr15,chr16,chr17,chr18,chr19,chr20,chr21,chr22,chr23,chr24,chr25,chr26  --out /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP350_maxDP2000_maf0.05_minQ30_maxmiss0.5 
#vcftools --vcf /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP350_maxDP2000_maf0.05_minQ30_maxmiss0.5.vcf --plink --out /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP350_maxDP2000_maf0.05_minQ30_maxmiss0.5 


#command to run: sbatch script_merge_filtered_pops_strict.sh