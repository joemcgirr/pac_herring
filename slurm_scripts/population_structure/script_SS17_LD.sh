#!/bin/bash

#SBATCH --job-name=SS17_LD
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e SS17_LD_%A_%a.err 
#SBATCH --time=1:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load vcftools 
vcftools --vcf /home/jamcgirr/ph/data/vcfs/split_pops/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf --plink --out /home/jamcgirr/ph/data/plink/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm 

module load plink 
plink --file /home/jamcgirr/ph/data/plink/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm --indep-pairwise 100 10 0.8 --r2 --out /home/jamcgirr/ph/data/plink/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm --threads 4 


#command to run: sbatch script_SS17_LD.sh