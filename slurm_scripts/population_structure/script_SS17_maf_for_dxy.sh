#!/bin/bash

#SBATCH --job-name=SS17_maf_for_dxy
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e SS17_maf_for_dxy_%A_%a.err 
#SBATCH --time=1:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -out /home/jamcgirr/ph/data/angsd/SFS/dxy/mafs/SS17_vcf -fai /home/jamcgirr/ph/data/c_harengus/c.harengus.fa.fai  -doMaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf -P 4 
gzip -d /home/jamcgirr/ph/data/angsd/SFS/dxy/mafs/SS17_vcf.mafs.gz 


#command to run: sbatch script_SS17_maf_for_dxy.sh