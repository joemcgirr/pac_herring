#!/bin/bash

#SBATCH --job-name=maf01
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e maf01_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -out /home/jamcgirr/ph/data/angsd/SFS/vcf/maf01/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.01 -fai /home/jamcgirr/ph/data/c_harengus/c.harengus.fa.fai -doGlf 2 -doMaf 3 -doMajorMinor 1 -doPost 1 -doGeno 2 -vcf-pl /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.01.vcf.gz -P 4 
#gzip -d /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/WA17.mafs.gz 


#command to run: sbatch script_maf01.sh