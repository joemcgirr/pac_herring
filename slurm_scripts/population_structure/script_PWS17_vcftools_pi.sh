#!/bin/bash

#SBATCH --job-name=PWS17_vcftools_pi
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e PWS17_vcftools_pi_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load vcftools 
vcftools --vcf /home/jamcgirr/ph/data/vcfs/split_pops/population_PWS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf --window-pi 50000 --out /home/jamcgirr/ph/data/vcfs/split_pops/vcftools_pi/pi_50kb_win_PWS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.txt 


#command to run: sbatch script_PWS17_vcftools_pi.sh