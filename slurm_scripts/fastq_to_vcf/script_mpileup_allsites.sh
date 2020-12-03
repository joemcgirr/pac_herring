#!/bin/bash

#SBATCH --job-name=mpileup_allsites
#SBATCH --mem=60G 
#SBATCH --ntasks=16 
#SBATCH -e mpileup_allsites_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools
module load samtools
bcftools mpileup -f /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -b /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/all_bams_p_1_5_rm.txt --threads 16 | bcftools call -m -Oz -f GQ --threads 16 -o all_sites_vcf

#run: sbatch script_mpileup_allsites.sh