#!/bin/bash

#SBATCH --job-name=convert_vcf2
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e convert_vcf2_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load vcftools 
vcftools --gzvcf /home/jamcgirr/ph/data/vcfs/bcftools_filter/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.01.vcf.gz --BEAGLE-PL --chr chr1 --out /home/jamcgirr/ph/data/vcfs/bcftools_filter/chr1_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.01 
vcftools --gzvcf /home/jamcgirr/ph/data/vcfs/bcftools_filter/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.01.vcf.gz --plink --out /home/jamcgirr/ph/data/vcfs/bcftools_filter/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.01 

module load plink 
plink --file /home/jamcgirr/ph/data/vcfs/bcftools_filter/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.01 --pca --out /home/jamcgirr/ph/data/plink/bcftools_filter/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.01

module load bcftools 
bcftools view /home/jamcgirr/ph/data/vcfs/bcftools_filter/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.01.vcf.gz | wc -l > /home/jamcgirr/ph/data/vcfs/bcftools_filter/lines_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.01


#run: sbatch script_convert_vcf2.sh