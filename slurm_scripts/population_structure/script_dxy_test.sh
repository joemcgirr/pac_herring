#!/bin/bash

#SBATCH --job-name=dxy_test
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e dxy_test_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -out BC17_vcf -fai /home/jamcgirr/ph/data/c_harengus/c.harengus.fa.fai  -doMaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/population_BC17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf -P 4
/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -out TB17_vcf -fai /home/jamcgirr/ph/data/c_harengus/c.harengus.fa.fai  -doMaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/population_TB17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf -P 4
/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -out PWS17_vcf -fai /home/jamcgirr/ph/data/c_harengus/c.harengus.fa.fai  -doMaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/population_PWS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf -P 4

 
#command to run: sbatch script_dxy_test.sh