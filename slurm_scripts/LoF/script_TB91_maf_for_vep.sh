#!/bin/bash

#SBATCH --job-name=TB91_maf_for_vep
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e TB91_maf_for_vep_%A_%a.err 
#SBATCH --time=1:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -out /home/jamcgirr/ph/data/LoF/mafs_REF_ALT/TB91_vcf -fai /home/jamcgirr/ph/data/c_harengus/c.harengus.fa.fai -ref /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -doMajorMinor 4 -doMaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/population_TB91_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf -P 4 
gzip -d /home/jamcgirr/ph/data/LoF/mafs_REF_ALT/TB91_vcf.mafs.gz 


#command to run: sbatch script_TB91_maf_for_vep.sh