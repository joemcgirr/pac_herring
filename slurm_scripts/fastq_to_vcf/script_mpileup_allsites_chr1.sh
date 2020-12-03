#!/bin/bash

#SBATCH --job-name=mpileup_allsites_chr1
#SBATCH --mem=60G 
#SBATCH --ntasks=16 
#SBATCH -e mpileup_allsites_chr1_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools
module load samtools
bcftools mpileup -f /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -b /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/all_bams_p_1_5_rm.txt -r chr1 --threads 16 | bcftools call -m -Oz -f GQ --threads 16 -o all_sites_chr1.vcf.gz

#run: sbatch script_mpileup_allsites_chr1.sh