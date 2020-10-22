#!/bin/bash

#SBATCH --job-name=vcf_to_plink_and_beagle_main_vcf
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e vcf_to_plink_and_beagle_main_vcf_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load vcftools 
vcftools --vcf /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf --BEAGLE-PL --chr chr2 --out /home/jamcgirr/ph/data/vcfs/chr2_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5 
vcftools --vcf /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf --BEAGLE-PL --chr chr3 --out /home/jamcgirr/ph/data/vcfs/chr3_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5 


#command to run: sbatch script_vcf_to_plink_and_beagle_main_vcf.sh