#!/bin/bash

#SBATCH --job-name=TB17_maf_for_vep
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e TB17_maf_for_vep_%A_%a.err 
#SBATCH --time=1:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -out /home/jamcgirr/ph/data/LoF/mafs_REF_ALT/TB17_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05 -fai /home/jamcgirr/ph/data/c_harengus/c.harengus.fa.fai -ref /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -doMajorMinor 4 -doMaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/maf05/population_TB17_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz -P 4 
gzip -d /home/jamcgirr/ph/data/LoF/mafs_REF_ALT/TB17_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.mafs.gz 


#command to run: sbatch script_TB17_maf_for_vep.sh